//
//  BookDetailUseCase.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

final class BookDetailUseCase {
    private let networkRequester: NetworkRequester
    
    init(networkRequester: NetworkRequester = .init()) {
        self.networkRequester = networkRequester
    }
    
    func getBookDetail(id: String) async throws -> VolumeDetail {
        let endPoint = APIList.Book.Detail(id: id)
        let urlRequest = try endPoint.asURLRequest()
        
        let dto: VolumeDetailDTO = try await networkRequester.request(urlRequest: urlRequest)
        
        return try VolumeDetail(dto: dto)
    }
}
