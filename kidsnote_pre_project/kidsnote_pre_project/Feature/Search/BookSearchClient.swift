//
//  BookSearchClient.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation
import Dependencies

struct BookSearchClient {
    let searchBooks: @Sendable (_ keyword: String, _ orderBy: OrderBy) async throws -> VolumeSearchResults
    let excutePagination: @Sendable () async throws -> VolumeSearchResults
    let refreshPagination: @Sendable () async throws -> VolumeSearchResults
    let reset: @Sendable () async -> Void
    
    enum BookSearchClientError: Error {
        case failInitializeVolumeKind
        case paginationCompleted
        case failPaginationCausedNilKeyword
    }
}

extension BookSearchClient: DependencyKey {
    static var liveValue: BookSearchClient {
        let requester = NetworkRequester()
        let cursor = PaginationCursor()
        
        return .init(
            searchBooks: { keyword, orderBy in
                await cursor.reset()
                
                let endPoint = APIList.Book.Search(
                    keyword: keyword, 
                    page: await cursor.currentPage, 
                    orderBy: orderBy
                )
                let dto: VolumeSearchResultsDTO = try await requester.request(
                    urlRequest: try endPoint.asURLRequest()
                )
                let searchResult = try await transform(dto: dto)
                await cursor.changeSearchOptions(keyword, orderBy: orderBy)
                await cursor.incrementResponseCount(dto.items.count, totalLimit: dto.totalItems)
                
                return searchResult
            },
            excutePagination: {
                guard let keyword = await cursor.keyword
                else { throw BookSearchClientError.failPaginationCausedNilKeyword }
                
                let endPoint = APIList.Book.Search(
                    keyword: keyword,
                    page: await cursor.currentPage, 
                    orderBy: await cursor.orderBy
                )
                let dto: VolumeSearchResultsDTO = try await requester.request(
                    urlRequest: try endPoint.asURLRequest()
                )
                let searchResult = try await transform(dto: dto)
                
                await cursor.incrementResponseCount(dto.items.count)
                
                return searchResult
            },
            refreshPagination: {
                await cursor.reset(.pagination)
                guard let keyword = await cursor.keyword
                else { throw BookSearchClientError.failPaginationCausedNilKeyword }
                
                let endPoint = APIList.Book.Search(
                    keyword: keyword,
                    page: await cursor.currentPage,
                    orderBy: await cursor.orderBy
                )
                let dto: VolumeSearchResultsDTO = try await requester.request(
                    urlRequest: try endPoint.asURLRequest()
                )
                let searchResult = try await transform(dto: dto)
                
                await cursor.incrementResponseCount(dto.items.count)
                
                return searchResult
            },
            reset: {
                await cursor.reset()
            }
        )
        
        @Sendable func transform(dto: VolumeSearchResultsDTO) async throws -> VolumeSearchResults {
            guard let volumeKind = VolumeKind(rawString: dto.kind)
            else { throw BookSearchClientError.failInitializeVolumeKind }
            
            let searchedItems = dto.items.reduce(into: [VolumeInformation]()) { (result, volumeDTO) in
                do {
                    let volume = try VolumeThumbnail(dto: volumeDTO.volumeInfo)
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
        
    }
    
}

extension DependencyValues {
    var bookSearchClient: BookSearchClient {
        get { self[BookSearchClient.self] }
        set { self[BookSearchClient.self] = newValue }
    }
}

extension BookSearchClient {
    actor PaginationCursor {
        var keyword: String?
        var orderBy: OrderBy = .relevance
        
        /// 검색중인 키워드의 첫번쨰 반환에서 전달 한 해당 키워드의 전체 검색결과 수
        var totalBooksLimit: Int?
        
        /// 전달받은 책의 수
        var responsedBooksCount: Int = 0
        var currentPage: Int = 0
        
        var isPaginationComplete: Bool {
            guard let totalBooksLimit else { return false }
            return totalBooksLimit <= responsedBooksCount
        }
        
        func reset(_ mode: Mode = .all) {
            switch mode {
            case .all:
                keyword = nil
                totalBooksLimit = nil
                responsedBooksCount = 0
                currentPage = 0
            
            case .pagination:
                totalBooksLimit = nil
                responsedBooksCount = 0
                currentPage = 0
            }
        }
        
        func changeSearchOptions(_ newKeyword: String, orderBy: OrderBy) {
            keyword = newKeyword
            totalBooksLimit = nil
            responsedBooksCount = 0
            currentPage = 0
        }
        
        func incrementResponseCount(_ count: Int, totalLimit: Int? = nil) {
            if let totalLimit {
                totalBooksLimit = totalLimit
            }
            responsedBooksCount += count
            currentPage += 1
        }
        
        enum Mode {
            case all
            case pagination
        }
    }
}
