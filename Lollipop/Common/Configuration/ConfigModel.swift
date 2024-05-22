//
//  ConfigModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.5.24..
//

import Foundation

struct ConfigModel: Codable {
    var genders: [Gender]?
    var cities: [String]?
    var languages: [Language]?
    var countries: [CountryCode]?
}

struct Gender: Codable {
    let code: String?
    let label: String?
}

struct Language: Codable {
    let name: String?
    let code: String?
    let locale: String?
    var lanCode: LanCode? {
        return (locale ?? "") == "en" ? .en : .mne
    }
}

struct CountryCode: Codable {
    let name: String?
    let phone_code: String?
    let iso_code: String?
    let flag: String?
}

