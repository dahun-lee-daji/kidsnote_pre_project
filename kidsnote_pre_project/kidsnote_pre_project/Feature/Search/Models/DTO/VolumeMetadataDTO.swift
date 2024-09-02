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
    
    let publisher: String?
    let publishedDate: String?
    let description: String?
    let pageCount: Int?
    let imageLinks: ImageLinkDTO?
    
    struct ImageLinkDTO: Decodable {
        let smallThumbnail: String?
        let thumbnail: String?
        let small: String?
        let medium: String?
        let large: String?
        let extraLarge: String?
    }
}
