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
    var featuredBanner: FeaturedBanner?
    var banners: [Banner]?
    var itemType: PartnerIitemType?
}

struct EnhancedCardTemplate  {
    let template: CardTemplate?
    let isLast: Bool?
}
