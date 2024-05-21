//
//  ConfigModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.5.24..
//

import Foundation

struct ConfigModel: Codable {
    var genders: [String]?
    var cities: [String]?
    var languages: [Language]?
}

struct Language: Codable {
    let name: String?
    let code: String?
    let locale: String?
    var lanCode: LanCode? {
        return (locale ?? "") == "en" ? .en : .mne
    }
}

