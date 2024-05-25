//
//  HomeModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct HomeModel : Codable {
    let brands: [Brand]?
    let elements: [Element]?
}

struct Brand: Codable {
    let id: Int?
    let name: String?
    let alias: String?
    let featured_image: String?
    let logo: String?
    let external_link: String?
    let external_link_label: String?
    let status: String?
}

struct FeaturedBanner: Codable {
    let title: String?
    let alias: String?
    let description: String?
    let external_link: String?
    let external_link_label: String?
    let status: String?
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
