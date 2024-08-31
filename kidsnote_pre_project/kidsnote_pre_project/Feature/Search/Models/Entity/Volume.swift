//
//  Volume.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 8/30/24.
//

import Foundation

struct Volume: Equatable {
    
    enum VolumeEntityError: Error {
        case invalidTitle
    }
    
    let title: String
    let author: AuthorCase
    let averageRating: Double?
    let numberOfRating: Int?
    
    init(dto: VolumeMetadataDTO) throws {
        guard let title = dto.title else { throw VolumeEntityError.invalidTitle }
        
        self.title = title
        self.author = AuthorCase(rawDatas: dto.authors)
        self.averageRating = dto.averageRating
        self.numberOfRating = dto.ratingsCount
    }
    
    init(
        title: String,
        author: AuthorCase,
        averageRating: Double?,
        ratingsCount: Int?
    ) {
        self.title = title
        self.author = author
        self.averageRating = averageRating
        self.numberOfRating = ratingsCount
    }
    
    var ratingDescription: String? {
        guard let averageRating else { return nil }
        
        var output = String(averageRating) + "★"
        if let numberOfRating {
            output += " (\(numberOfRating))"
        }
        return output
    }
    
}

enum AuthorCase: Equatable, CustomStringConvertible {
    var description: String {
        switch self {
        case .none : return "작가 미상"
        case .solo(let name):
            return name
        case .duo(let names):
            return "\(names[0]) 및 \(names[1])"
        case .collaboration(let names):
            return names.joined(separator: ", ")
        }
    }
    
    /// author에 대한 정보가 없는 경우가 존재 함.
    case none
    case solo(name: String)
    case duo(names: [String])
    case collaboration(names: [String])
    
    init(rawDatas: [String]?) {
        guard let rawDatas else {
            self = .none
            return
        }
        switch rawDatas.count {
        case 1:
            guard let name = rawDatas.first else {
                self = .none
                return
            }
            self = .solo(name: name)
        case 2:
            guard
                let firstMan = rawDatas.first,
                let secondMan = rawDatas.last
            else {
                self = .none
                return
            }
            self = .duo(names: [firstMan, secondMan])
        case 3...:
            self = .collaboration(names: rawDatas)
        default: 
            self = .none
            return
        }
    }
    
}
