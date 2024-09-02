//
//  VolumeDetail.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

struct VolumeDetail {
    
    enum VolumeDetailError: Error {
        case failInitializeVolumeKind
        case invalidTitle
    }
    
    let kind: VolumeKind
    let id: String
    
    let imageURL: ImageURL
    let title: String
    let author: AuthorCase
    let averageRating: Double?
    let numberOfRating: Int?
    let pageCount: Int?
    
    let description: String?
    
    let publisher: String?
    let publishedDate: String?
    
    let epubDownloadLink: String?
    let purchaseLink: String?
    
    init(dto: VolumeDetailDTO) throws {
        guard let kind = VolumeKind(rawString: dto.kind) else {
            throw VolumeDetailError.failInitializeVolumeKind
        }
        guard let title = dto.volumeInfo?.title else { throw VolumeDetailError.invalidTitle }
        
        self.kind = kind
        self.id = dto.id
        self.imageURL = ImageURL(
            dto: dto.volumeInfo?.imageLinks,
            preferredMode: .thumbnail
        )
        self.title = title
        self.author = AuthorCase(rawDatas: dto.volumeInfo?.authors)
        self.averageRating = dto.volumeInfo?.averageRating
        self.numberOfRating = dto.volumeInfo?.ratingsCount
        self.pageCount = dto.volumeInfo?.pageCount
        self.description = dto.volumeInfo?.description
        self.publisher = dto.volumeInfo?.publisher
        self.publishedDate = dto.volumeInfo?.publishedDate
        self.epubDownloadLink = dto.accessInfo?.epub?.acsTokenLink
        self.purchaseLink = dto.saleInfo?.buyLink
    }
}

struct ImageURL: Equatable {
    enum Mode: CaseIterable {
        case none
        case smallThumbnail
        case thumbnail
        case small
        case medium
        case large
        case extraLarge
        
        // 다음 Mode를 반환하는 함수
        func next() -> Mode {
            let allCases = Self.allCases
            if let currentIndex = allCases.firstIndex(of: self), currentIndex < allCases.endIndex - 1 {
                return allCases[allCases.index(after: currentIndex)]
            } else {
                return .smallThumbnail // wraparound를 위해 처음으로 돌아감
            }
        }
    }
    
    var url: String?
    let currentMode: Mode
    let preferredMode: Mode
    
    init(dto: VolumeMetadataDTO.ImageLinkDTO?, preferredMode: Mode) {
        self.preferredMode = preferredMode
        guard let dto else {
            self.currentMode = .none
            return
        }
        guard preferredMode != .none else {
            self.currentMode = .none
            return
        }
        
        var mode = preferredMode
        // 선호하는 image의 url이 없는 경우, WrapAround하도록 구현
        repeat {
            switch mode {
            case .smallThumbnail: self.url = dto.smallThumbnail
            case .thumbnail: self.url = dto.thumbnail
            case .small: self.url = dto.small
            case .medium: self.url = dto.medium
            case .large: self.url = dto.large
            case .extraLarge: self.url = dto.extraLarge
            case .none: self.url = nil
            }
            
            if url != nil { break }
            
            mode = mode.next()
        } while mode != preferredMode
        self.currentMode = mode
    }
    
}
