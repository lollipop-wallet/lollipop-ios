//
//  HomeModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

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
