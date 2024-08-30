//
//  BookSearchClient.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation
import Dependencies

struct BookSearchClient {
    let searchBooks: @Sendable (_ keyword: String) async throws -> VolumeSearchResults
    
    enum BookSearchClientError: Error {
        case failInitializeVolumeKind
    }
}

extension BookSearchClient: DependencyKey {
    static var liveValue: BookSearchClient {
        let requester = NetworkRequester()
        
        return .init(
            searchBooks: {
                keyword in
                let endPoint = EndPoint(
                    scheme: .https,
                    host: "www.googleapis.com",
                    method: .get,
                    path: "/books/v1/volumes",
                    parameter: [
                        "q": "\(keyword)",
                        //                "projection": "lite", // projection을 쓰려했는데, averageRating이 projection에서 나오지 않음.
                        //                "filter": "ebooks",
                        "startIndex": "0",
                        "maxResults": "30",
                        "langRestrict": "kr"
                    ]
                )
                let dto: VolumeSearchResultsDTO = try await requester.request(
                    urlRequest: try endPoint.asURLRequest()
                )
                guard let volumeKind = VolumeKind(rawString: dto.kind)
                else { throw BookSearchClientError.failInitializeVolumeKind }
                
                let searchedItems = dto.items.reduce(into: [VolumeInformation]()) { (result, volumeDTO) in
                    // TODO: 네이밍이 혼란스러움 수정 필요
                    do {
                        let volume = try Volume(dto: volumeDTO.volumeInfo)
                        let volumeInformation = VolumeInformation(
                            kind: volumeDTO.kind,
                            id: volumeDTO.id,
                            volumeInfo: volume
                        )
                        result.append(volumeInformation)
                    } catch {
                        print("\(error.localizedDescription) Failed to initialize Entity from DTO: \(volumeDTO.id)")
                    }
                }
                
                return .init(
                    kind: volumeKind,
                    searchedItems: searchedItems,
                    totalItems: dto.totalItems
                )
            }
        )
        
    }
    
    
}

extension DependencyValues {
    var bookSearchClient: BookSearchClient {
        get { self[BookSearchClient.self] }
        set { self[BookSearchClient.self] = newValue }
    }
}
