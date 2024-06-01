//
//  LocationsModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct LocationsModel : Codable {
    let locations: [Location]?
    let cities: [String]?
    let brands: [Brand]?
}

struct Location: Codable {
    let name: String?
    let alias: String?
    let description: String?
    let city: String?
    let address: String?
    let lat: String?
    let lon: String?
    let phone: String?
    let email: String?
}

struct City {
    var cityName: String?
    var selected: Bool?
}
