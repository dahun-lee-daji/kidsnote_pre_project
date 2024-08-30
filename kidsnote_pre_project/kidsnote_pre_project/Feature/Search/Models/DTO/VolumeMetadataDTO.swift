//
//  VolumeMetadataDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct VolumeMetadataDTO: Decodable {
    let title: String?
    let authors: [String]?
    let averageRating: Double?
    let ratingsCount: Int?
}
