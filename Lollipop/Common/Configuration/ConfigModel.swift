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
    let id: Int?
    var lanCode: LanCode? {
        return (locale ?? "") == "en" ? .en : .mne
    }
    var localizedName: String {
        return (locale ?? "") == "en" ? LocalizedTitle.eng.localized : LocalizedTitle.mne.localized
    }
    var icon: String {
        return (locale ?? "") == "en" ? AssetTitles.flagEngIcon : AssetTitles.flagMneIcon
    }
    var selected: Bool?
}

struct CountryCode: Codable {
    let name: String?
    let phone_code: String?
    let iso_code: String?
    let flag: String?
    var dropItem: String {
        return "\(flag ?? "") \(name ?? "") +\(phone_code ?? "")"
    }
}

