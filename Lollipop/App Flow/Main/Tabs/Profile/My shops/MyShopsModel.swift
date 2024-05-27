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
    var id: Int?
    var name: String?
    var alias: String?
    var featured_image: String?
    var logo: String?
    var external_link: String?
    var external_link_label: String?
    var status: String?
    var is_favorite: Int?
    var favoriteIcon: UIImage {
        return UIImage(named: (is_favorite ?? 0) == 1 ? AssetTitles.heartIcon : AssetTitles.outlinedHeartIcon)!
    }
    var favoriteIconTintColor: UIColor {
        return (is_favorite ?? 0) == 1 ? AppColors.brandPrimary : AppColors.darkGrey
    }
}
