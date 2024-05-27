//
//  MyShopsModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct MyShopsModel : Codable {
    let data: [Shop]?
}

struct Shop: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let featured_image: String?
    let logo: String?
    let external_link: String?
    let external_link_label: String?
    let status: String?
    let is_favorite: Int?
    var favoriteIcon: UIImage {
        return UIImage(named: (is_favorite ?? 0) == 1 ? AssetTitles.heartIcon : AssetTitles.outlinedHeartIcon)!
    }
    var favoriteIconTintColor: UIColor {
        return (is_favorite ?? 0) == 1 ? AppColors.brandPrimary : AppColors.darkGrey
    }
}
