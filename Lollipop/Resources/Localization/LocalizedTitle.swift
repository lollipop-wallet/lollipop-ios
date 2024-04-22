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
    case onboardingTitle1
    case onboardingTitle2
    case onboardingTitle3
    case onboardingTitle4
    case onboardingSubtitle1
    case onboardingSubtitle2
    case onboardingSubtitle3
    case onboardingSubtitle4
    case cont
    case moveForward
    

    var localized: String {
        return self.rawValue.localized()
    }
}
