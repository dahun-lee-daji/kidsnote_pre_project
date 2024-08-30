//
//  VolumeDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct VolumeDTO: Decodable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo: VolumeMetadataDTO
}

