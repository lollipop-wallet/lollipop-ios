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
    case lollipop
    case continueWithGoogle
    case continueWithApple
    case continueWithFacebook
    case continueWirhEmail
    case or
    case and
    case termsPart1
    case termsPart2
    case terms
    case privacy
    case newUser
    case name
    case surname
    case email
    case dateOfBirh
    case gender
    case city
    case optional
    case choose
    case chooseCity
    case passwordCreation
    case enterPassword
    case confirmPassword
    case confirmEmailAdderss
    case activationCode
    case activationCodeTitle
    case activationCodeText1
    case activationCodeText2
    

    var localized: String {
        return self.rawValue.localized()
    }
}
