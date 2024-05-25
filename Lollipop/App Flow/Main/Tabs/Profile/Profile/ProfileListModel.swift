//
//  ProfileListModel.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import Foundation

struct ProfileListModel {
    let icon: String
    let title: String
    let item: ProfileItem
    var separatorHidden: Bool {
        return item == .shops || item == .terms
    }
}
