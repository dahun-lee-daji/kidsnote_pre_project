//
//  VolumeAceessMetadataDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

struct VolumeAceessMetadataDTO: Decodable {
    let country: String?
    let viewability: String?
    let embeddable: Bool?
    let publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub: EpubDTO?
    let pdf: PDFAvailableDTO?
    let accessViewStatus: String?
    
    struct EpubDTO: Decodable {
        let isAvailable: Bool?
        let acsTokenLink: String?
    }

    struct PDFAvailableDTO: Decodable {
        let isAvailable: Bool?
    }
}


