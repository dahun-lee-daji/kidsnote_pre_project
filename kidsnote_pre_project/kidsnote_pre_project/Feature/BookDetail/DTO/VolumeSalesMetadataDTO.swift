//
//  VolumeSalesMetadataDTO.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/1/24.
//

import Foundation

struct VolumeSalesMetadataDTO: Decodable {
    let country: String?
    let saleability: String?
    let isEbook: Bool?
    let listPrice: CurrencyAmountDTO?
    let retailPrice: CurrencyAmountDTO?
    let buyLink: String?
    
    struct CurrencyAmountDTO: Decodable {
        let amount: Double?
        let currencyCode: String?
    }
}
