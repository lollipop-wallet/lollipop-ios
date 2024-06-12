//
//  DefaultModels.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation

struct DefaultModels {
    let onboardingDatasource = [OnboardingModel(artwork: AssetTitles.onboardingIcon1, title: LocalizedTitle.onboardingTitle1.localized, subtitle: LocalizedTitle.onboardingSubtitle1.localized),
                                OnboardingModel(artwork: AssetTitles.onboardingIcon2, title: LocalizedTitle.onboardingTitle2.localized, subtitle: LocalizedTitle.onboardingSubtitle2.localized),
                                OnboardingModel(artwork: AssetTitles.onboardingIcon3, title: LocalizedTitle.onboardingTitle3.localized, subtitle: LocalizedTitle.onboardingSubtitle3.localized),
                                OnboardingModel(artwork: AssetTitles.onboardingIcon4, title: LocalizedTitle.onboardingTitle4.localized, subtitle: LocalizedTitle.onboardingSubtitle4.localized)]
    let unselected = [AssetTitles.homeUnselectedIcon, AssetTitles.partnersUnselectedIcon, "", AssetTitles.cardsIcon, AssetTitles.profileUnselectedIcon]
    let selected = [AssetTitles.homeSelectedIcon, AssetTitles.partnersSelectedIcon, "", AssetTitles.walletSelectedIcon, AssetTitles.profileSelectedIcon]
    
    let profileDatasource = [[ProfileListModel(icon: AssetTitles.cardsIcon, title: LocalizedTitle.myCards.localized, item: .cards),
                              ProfileListModel(icon: AssetTitles.storeOutlinedIcon, title: LocalizedTitle.favoriteStores.localized, item: .shops)],
                             
                             [ProfileListModel(icon: AssetTitles.settingsIcon, title: LocalizedTitle.profileSettings.localized, item: .settings),
                            ProfileListModel(icon: AssetTitles.aboutIcon, title: LocalizedTitle.aboutApp.localized, item: .about),
                            ProfileListModel(icon: AssetTitles.logoutIcon, title: LocalizedTitle.signOut.localized, item: .signout)]]
    
    let personalDataDatasource = [ProfileSettingsModel(icon: AssetTitles.personalDataIcon, title: LocalizedTitle.personalData.localized, item: .data),
                                  ProfileSettingsModel(icon: AssetTitles.lockIcon, title: LocalizedTitle.passwordChange.localized, item: .password),
                                  ProfileSettingsModel(icon: AssetTitles.changeLanguageIcon, title: LocalizedTitle.changeLanguage.localized, item: .language)]
    
//    let languageDatasource = [LanguageModel(flag: AssetTitles.flagMneIcon, title: LocalizedTitle.mne.localized, lanCode: .mne, selected: false),
//                              LanguageModel(flag: AssetTitles.flagEngIcon, title: LocalizedTitle.eng.localized, lanCode: .en, selected: false)]
    
    let partnerCardOptionsDatasource = [PartnerCardOptionModel(title: LocalizedTitle.ihaveCardTitle.localized, subtitile: LocalizedTitle.iHaveCardSubtitle.localized, icon: AssetTitles.cardFilledIcon, option: .possessesCard),
                                        PartnerCardOptionModel(title: LocalizedTitle.iWantCardTitle.localized, subtitile: LocalizedTitle.iWantCardSubtitle.localized, icon: AssetTitles.sendFilledIcon, option: .wantsCard)]
    let allCardsCard = Card(id: 0, name: "", alias: "", name_on_card: "", image_front: "", image_back: "", code: "", cardNumber: "", note: "", type: "", card_template: nil, partner: nil, position: 0, isSeeAllCards: true)
}
