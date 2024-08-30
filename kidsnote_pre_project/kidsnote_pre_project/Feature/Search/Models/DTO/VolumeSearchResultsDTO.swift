//
//  VolumeSearchResultsDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct VolumeSearchResultsDTO: Decodable {
    let kind: String
    let items: [VolumeDTO]
    let totalItems: Int
}
