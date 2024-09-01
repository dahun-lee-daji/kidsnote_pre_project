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
    
    func getBookDetail(id: String) async throws {
        let endPoint = APIList.Book.Detail(id: id)
//        let dto:
//        networkRequester.request(urlRequest: <#T##URLRequest#>)
    }
}
