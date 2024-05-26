//
//  ProfileModel.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct ProfileModel : Codable {
    let name: String?
    let email: String?
    let phone: String?
    let date_of_birth: String?
    let country: String?
    let gender: String?
    let avatar: String?
    let language: Language?
}

