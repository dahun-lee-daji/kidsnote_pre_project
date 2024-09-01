//
//  VolumeSearchResults.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct VolumeSearchResults: Equatable {
    let kind: VolumeKind
    let searchedItems: [VolumeInformation]
    let totalItems: Int
}

enum VolumeKind: Equatable {
    /// 일반적인 책
    case volume
    /// 서가
    case bookshelf
    
    init?(rawString: String) {
        if 
            rawString == "books#volumes"
                || rawString == "books#volume"
        {
            self = .volume
        } 
        else if rawString == "books#bookshelf"
        {
            self = .bookshelf
        } 
        else
        {
            return nil
        }
    }
}
