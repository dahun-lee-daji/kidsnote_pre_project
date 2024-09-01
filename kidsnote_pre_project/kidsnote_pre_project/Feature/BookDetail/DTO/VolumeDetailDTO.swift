//
//  VolumeDetailDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

struct VolumeDetailDTO: Decodable {
    let kind: String
    let id: String
    let etag: String
    let volumeInfo: VolumeMetadataDTO?
    let saleInfo: VolumeSalesMetadataDTO?
    let accessInfo: VolumeAceessMetadataDTO?
}
