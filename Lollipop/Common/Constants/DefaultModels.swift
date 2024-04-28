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
    let unselected = [AssetTitles.homeUnselectedIcon, AssetTitles.partnersUnselectedIcon, "", AssetTitles.lollipopUnselectedIcon, AssetTitles.profileUnselectedIcon]
    let selected = [AssetTitles.homeSelectedIcon, AssetTitles.partnersSelectedIcon, "", AssetTitles.lollipopSelectedIcon, AssetTitles.profileSelectedIcon]
    
    let profileDatasource = [ProfileListModel(icon: AssetTitles.settingsIcon, title: LocalizedTitle.profileSettings.localized, item: .settings),
                             ProfileListModel(icon: AssetTitles.cardsIcon, title: LocalizedTitle.myCards.localized, item: .cards),
                             ProfileListModel(icon: AssetTitles.aboutIcon, title: LocalizedTitle.aboutApp.localized, item: .about),
                             ProfileListModel(icon: AssetTitles.changeLanguageIcon, title: LocalizedTitle.changeLanguage.localized, item: .language),
                             ProfileListModel(icon: AssetTitles.termsIcon, title: LocalizedTitle.termsOfUse.localized, item: .terms)]
    
    let personalDataDatasource = [ProfileSettingsModel(icon: AssetTitles.personalDataIcon, title: LocalizedTitle.personalData.localized, item: .data),
                                  ProfileSettingsModel(icon: AssetTitles.lockIcon, title: LocalizedTitle.passwordChange.localized, item: .password)]
    
    let languageDatasource = [LanguageModel(flag: AssetTitles.flagMneIcon, title: LocalizedTitle.mne.localized, lanCode: .mne, selected: false),
                              LanguageModel(flag: AssetTitles.flagEngIcon, title: LocalizedTitle.eng.localized, lanCode: .en, selected: false)]
}
