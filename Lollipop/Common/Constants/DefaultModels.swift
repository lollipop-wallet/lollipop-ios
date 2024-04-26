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
}
