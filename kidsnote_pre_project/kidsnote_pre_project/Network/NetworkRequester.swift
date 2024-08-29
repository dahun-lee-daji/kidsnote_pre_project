//
//  NetworkRequester.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/29/24.
//

import Foundation

final class NetworkRequester {
    
    private let urlSession: URLSession
    
    init(configuration: URLSessionConfiguration = .defaultConfiguration) {
        self.urlSession = URLSession(configuration: configuration)
    }
    
}

private extension URLSessionConfiguration {
    class var defaultConfiguration: URLSessionConfiguration {
        let configuration = Self.default
        configuration.timeoutIntervalForRequest = 5.0
        configuration.timeoutIntervalForResource = 5.0
        return configuration
    }
    
}
