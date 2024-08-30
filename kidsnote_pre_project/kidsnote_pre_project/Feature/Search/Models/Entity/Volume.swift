//
//  Volume.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct Volume {
    let title: String
    let author: AuthorCase
    let averageRating: Double?
    let ratingsCount: Int?
}

enum AuthorCase {
    case none
    case solo(name: String)
    case duo(names: [String])
    case collaboration(names: [String])
}
