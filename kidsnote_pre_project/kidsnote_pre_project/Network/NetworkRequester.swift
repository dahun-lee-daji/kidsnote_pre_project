//
//  NetworkRequester.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/29/24.
//

import Foundation

final class NetworkRequester {
    
    enum NetworkRequesterError: Error {
        case invalidStatusCode
        case failTransformHTTPURLResponse
        case failDecoding
        case failPrettyPrint
    }
    
    private let session: URLSession
    
    init(configuration: URLSessionConfiguration = .defaultConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    func request<T: Decodable>(urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await session.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkRequesterError.failTransformHTTPURLResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else { throw NetworkRequesterError.invalidStatusCode }
        
        return try decode(data)
    }
    
    private func decode<T: Decodable>(_ data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            prettyPrintedData(data)
            throw NetworkRequesterError.failDecoding
        }
    }
    
    private func prettyPrintedData(_ data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            guard let prettyString = String(data: prettyData, encoding: .utf8)
            else { throw NetworkRequesterError.failPrettyPrint }
            print(prettyString)
        } catch {
            print("Failed to convert data to pretty-printed JSON: \(error.localizedDescription)")
        }
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
