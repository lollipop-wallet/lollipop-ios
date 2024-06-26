//
//  PartnerListModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 04/06/2024.
//

import Foundation

struct PartnerListModel {
    var card: EnhancedCardTemplate?
    var brands: [Brand]?
    var featuredBanner: Banner?
    var banners: [Banner]?
    var customLink: CustomLink?
    var itemType: PartnerIitemType?
}

struct EnhancedCardTemplate  {
    let template: CardTemplate?
    let isLast: Bool?
}

struct CustomLink {
    let title: String?
    let link: String?
}
