//
//  Analytics.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import FirebaseAnalytics

class Events {
    func reportEventWithoutParam(eventName: FirebaseEvents) {
        Analytics.logEvent(eventName.rawValue, parameters: nil)
    }
    
    func reportEventWith(eventName: FirebaseEvents, parameterName: FirebaseEventsParameter, parameterValue: String){
        Analytics.logEvent(eventName.rawValue, parameters: [parameterName.rawValue : parameterValue])
    }
}
