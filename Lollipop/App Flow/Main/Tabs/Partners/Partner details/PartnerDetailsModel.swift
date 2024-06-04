//
//  PartnerDetailsModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct PartnerDetailsModel : Codable {
    let id: Int?
    let name: String?
    let featured_image: String?
    let logo: String?
    let external_link: String?
    let external_link_label: String?
    let status: String?
    let partner: Partner?
    let banners: [Banner]?
    let user_favorite: UserFavorite?
}

struct UserFavorite: Codable {
    let is_favorite: Int?
}
