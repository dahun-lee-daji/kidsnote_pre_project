//
//  VolumeSearchResults.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct VolumeSearchResults {
    let kind: VolumeKind
    let searchedItems: [VolumeInformation]
    let totalItems: Int
}

enum VolumeKind {
    /// 일반적인 책
    case volume
    /// 서가
    case bookshelf
    
    init?(rawString: String) {
        if rawString == "books#volumes" {
            self = .volume
        } else if rawString == "books#bookshelf" {
            self = .bookshelf
        } else {
            return nil
        }
    }
}
