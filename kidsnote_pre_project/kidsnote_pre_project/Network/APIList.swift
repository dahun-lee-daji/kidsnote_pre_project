//
//  APIList.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/31/24.
//

import Foundation

enum APIList { }

extension APIList {
    enum Book { }
}

extension APIList.Book {
    struct Search: EndPointProducable {
        let scheme: SchemeType = .https
        let host: String = "www.googleapis.com"
        let method: HTTPMethod = .get
        let path: String = "/books/v1/volumes"
        
        var parameter: [String : String]?
        
        let requestingBooksCount = 40
        
        init(keyword: String, page: Int) {
            self.parameter = [
                "q": "\(keyword)",
                "filter": "ebooks",
                "startIndex": "\(page)",
                "maxResults": "\(requestingBooksCount)",
                "langRestrict": "\(Locale.current.regionCode ?? "en")"
            ]
        }
        
    }
    
    struct Detail: EndPointProducable {
        let scheme: SchemeType = .https
        let host: String = "www.googleapis.com"
        let method: HTTPMethod = .get
        let path: String
        var parameter: [String : String]?
        
        init(id: String) {
            self.path = "/books/v1/volumes/\(id)"
            self.parameter = ["key": Secret.key]
        }
        
    }
}
