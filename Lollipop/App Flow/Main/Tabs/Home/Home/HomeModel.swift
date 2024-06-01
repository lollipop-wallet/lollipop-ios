//
//  HomeModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

struct HomeModel : Codable {
    let user: User?
    let cards: [Card]?
    let brands: [Brand]?
    let elements: [Element]?
}

struct User: Codable {
    let name: String?
    let email: String?
    let phone: String?
    let date_of_birth: String?
    let country: String?
    let gender: String?
    let avatar: String?
    let language: Language?
}

struct Card: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let name_on_card: String?
    let image_front: String?
    let image_back: String?
    let code: String?
    let cardNumber: String?
    let note: String?
    let type: String?
    var is_favorite: Int?
    let card_template: CardTemplate?
    let partner: Partner?
    let position: Int?
    var favoriteIcon: UIImage {
        return UIImage(named: (is_favorite ?? 0) == 1 ? AssetTitles.heartIcon : AssetTitles.outlinedHeartIcon)!
    }
    var favoriteIconTintColor: UIColor {
        return (is_favorite ?? 0) == 1 ? AppColors.brandPrimary : AppColors.darkGrey
    }
    var isCardNameHidden: Bool {
        return (name ?? "").isEmpty
    }
    var isNameOnTheCardHidden: Bool {
        return (name_on_card ?? "").isEmpty
    }
    var isBarcodeHidden: Bool {
        return (code ?? "").isEmpty
    }
    var isCardNumberHidden: Bool {
        return (cardNumber ?? "").isEmpty
    }
    var isNotesHidden: Bool {
        return (note ?? "").isEmpty
    }
    var cardType: CardType {
        return (type ?? "") == "loyalty" ? .loyalty : .display
    }
}

struct CardTemplate: Codable {
    let id: Int?
    let name: String?
    let image_front: String?
    let image_back: String?
    let code_type: String?
    let cta_links_to: String?
}

struct Partner: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let logo: String?
    let status: String?
    let is_featured: Int?
    let is_official: Int?
    let brands: [Brand]?
}

struct Brand: Codable {
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
    var selected: Bool?
}

struct FeaturedBanner: Codable {
    var title: String?
    var alias: String?
    var featured_image: String?
    var description: String?
    var external_link: String?
    var external_link_label: String?
    var status: String?
    let brand: Brand?
}

struct Banner: Codable {
    let title: String?
    let alias: String?
    let featured_image: String?
    let intro: String?
    let description: String?
    let external_link: String?
    let external_link_label: String?
    let status: String?
    let brand: Brand?
}

struct Element: Codable {
    let title: String?
    let description: String?
    let featured_image: String?
    let featured_banner: FeaturedBanner?
    let banners: [Banner]?
}
