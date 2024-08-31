//
//  EndPoint.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/29/24.
//

import Foundation

fileprivate enum EndPointError: Error {
    case failCreateURL
    case failTransForm
}

protocol EndPointProducable {
    var scheme: SchemeType { get }
    var host: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var parameter: [String: String]? { get }
}

extension EndPointProducable {
    func asURLRequest() throws -> URLRequest {
        var component = URLComponents()
        component.scheme = scheme.rawValue
        component.host = host
        component.path = path
        component.queryItems = .init(parameter: parameter)

        guard let url = component.url else { throw EndPointError.failCreateURL }
          
        var request = URLRequest.init(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}

private extension Array<URLQueryItem> {
    init?(parameter: [String: String?]?) {
        if let parameter {
            self = parameter.map { (key: String, value: String?) in
                URLQueryItem(name: key, value: value)
            }
        } else {
            return nil
        }
    }
}

enum SchemeType: String {
    case http
    case https
}
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}
