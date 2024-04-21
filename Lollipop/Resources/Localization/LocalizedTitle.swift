//
//  LocalizedTitle.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import Localize_Swift


enum LocalizedTitle: String {
    case cancel
    case openSettings

    var localized: String {
        return self.rawValue.localized()
    }
}
