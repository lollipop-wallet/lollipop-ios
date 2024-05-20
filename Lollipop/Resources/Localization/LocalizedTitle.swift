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
    case home
    case partners
    case profile
    case myProfile
    case favoriteShops
    case profileSettings
    case myCards
    case aboutApp
    case changeLanguage
    case termsOfUse
    case personalData
    case passwordChange
    case accountDeletion
    case save
    case currentPassword
    case newPassword
    case confirmNewPassword
    case deleteAccountTitle
    case deleteAccountSubtitle
    case deleteAccount
    case myShops
    case mne
    case eng
    case chooseAppLanguage
    case ourPartners
    case all
    case favorite
    case cantSeeFavoriteBrand
    case recommendLollipopPartner
    case partnerDetails
    case shopName
    case enterShopMerchantName
    case additionalNote
    case enterAddress
    case max300Chars
    case address
    case send
    case thanksForSuggestionTitle
    case thanksForSuggestionSubtitle
    case ok
    case tryAgain
    case chooseFavorites
    case handpickedCards
    case otherCards
    case sort
    case sortCardBy
    case cardName
    case manually
    case editCardsOrder
    case done
    case addCard
    case cardDetails
    case barcode
    case notes
    case edit
    case cardTitle
    case delete
    case cardNumber
    case cardDeletion
    case cardDeletionTitle
    case cardDeletionSubtitle
    case deleteCard
    case signIn
    case digitalizePlasticCardTitle
    case digitalizePlasticCardSubtitle
    case seeAll
    case allPromotions
    case locations
    case aboutProgramme
    case rules
    case saleSpots
    case allCities
    case allShops
    case locationsOverview
    case chooseShop
    case reset
    case programmeRules
    case options
    case ihaveCardTitle
    case iHaveCardSubtitle
    case iWantCardTitle
    case iWantCardSubtitle
    case newPartnerCardInfo
    case nameAndSurname
    case phoneNumber
    case enterNameAndSurname
    case iAgreeWith
    case termsString
    case thisCard
    case scan
    case scanBarcodeFromCard
    case cardDoesntHaveBarcode
    case enterManually
    case loyaltyCards
    case nameOnTheCard
    case frontSide
    case backSide
    case frontCardPage
    case backCardPage
    case takeAPhoto
    case photoAlbum
    case photoOrAlbumDescription
    case details
    case seeAllCards
    case enterEmailAddress
    
    var localized: String {
        return self.rawValue.localized()
    }
}
