//
//  FirebaseEvents.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation

enum FirebaseEvents : String {
    case subSuccess = "subscription_success"
    case selectCountryOpened = "select_country_screen_opened"
    case countruSelected = "country_selected"
    case numberTypeSelected = "number_type_selected"
    case areaSelected = "area_selected"
    case numberSelected = "number_selected"
    case numberPurchaseFailure = "plans_subscribe_failed"
    case buyAdditionalNumber = "buy_additional_number_click"
    case buyThirdNumberClick = "buy_third_number_click"
    case onboardingRandomNumberOpened = "onboarding_random_number_screen_opened"
    case onboardingScrollerOpened = "onboarding_scroller_screen_opened"
    case pickAnotherNumberTap = "pick_another_number_click"
    
    case rateUsPopupOpened = "rate_us_popup_opened"
    case rateUsPopupClosed = "rate_us_popup_closed"
    case rateUsPopupActionYes = "rate_us_popup_action_yes"
    case rateUsPopupActionNo = "rate_us_popup_action_no"
    case rateUsPopupActionFeedback = "rate_us_popup_action_feedback"
    case rateUsPopupActionFeedbackClosed = "rate_us_popup_action_feedback_closed"
    case rateUsPopupActionRate = "rate_us_popup_action_rate"
    case rateUsPopupActionRateClosed = "rate_us_popup_action_rate_closed"
    
    case rcPurchaseError = "rc_purchase_error"

}


enum FirebaseEventsParameter : String {
    case banner = "baner"
    case selectedNumberType = "selected_number_type"
    case selectedCountry = "selected_country"
    case selectedArea = "selected_area"
    case selectedNumber = "selected_number"
    case selectedPlan = "selected_plan"
    case numberPurchaseFailure = "plans_subscribe_error"
    case rcErrorCode = "rc_error_code"
}
