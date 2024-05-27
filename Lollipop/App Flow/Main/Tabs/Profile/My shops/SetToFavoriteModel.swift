//
//  SetToFavoriteModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/05/2024.
//

import Foundation

struct SetToFavoriteModel: Codable {
    let favorite: Int?
    let message: String?
    let data: FavoriteBrand?
}

struct FavoriteBrand: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let featured_image: String?
    let logo: String?
    let created_at: String?
    let updated_at: String?
    let partner_id: Int?
    let external_link: String?
    let external_link_label: String?
    let status: String?
}
