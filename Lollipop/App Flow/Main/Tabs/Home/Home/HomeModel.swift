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
    var card_template: CardTemplate?
    let partner: Partner?
    let position: Int?
    let code_type: String?
    let customer_code: String?
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
    var isSeeAllCards: Bool?
    
    var cardCodeType: CardCodeType {
        get {
            if card_template == nil {
                if (code_type ?? "") == "bar_code" {
                    return .barcode
                }else if (code_type ?? "") == "qr_code"{
                    return .qrcode
                }else if (code_type ?? "") == "plain_code"{
                    return .plaincode
                }else{
                    return .nocode
                }
            }else{
                if (card_template?.code_type ?? "") == "bar_code" {
                    return .barcode
                }else if (card_template?.code_type ?? "") == "qr_code"{
                    return .qrcode
                }else if (card_template?.code_type ?? "") == "plain_code"{
                    return .plaincode
                }else{
                    return .nocode
                }
            }
        }
        set {
        }
    }
    
    var isBarcodeImageHidden: Bool {
        return cardCodeType != .barcode
    }
    
    var isQRImageHidden: Bool {
        return cardCodeType != .qrcode
    }
    
}

struct CardTemplate: Codable {
    let id: Int?
    let name: String?
    let image_front: String?
    let image_back: String?
    var code_type: String?
    let cta_links_to: String?
    let terms_conditions_url: String?
}

struct Partner: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let logo: String?
    let status: String?
    let is_featured: Int?
    let is_official: Int?
    let card_templates: [CardTemplate]?
    let brands: [Brand]?
    let rule: Rule?
    let instruction: Instruction?
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
    let is_featured: Int?
    let brand: Brand?
}

struct Element: Codable {
    let title: String?
    let description: String?
    let featured_image: String?
    let featured_banner: FeaturedBanner?
    let banners: [Banner]?
}

struct Rule: Codable {
    let title: String?
    let description: String?
    let label: String?
    let icon: String?
}

struct Instruction: Codable {
    let title: String?
    let description: String?
    let label: String?
    let icon: String?
}
