//
//  StorageManager.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation

class StorageManager {
    
    static let sharedInstance = StorageManager()
    
    func saveIMEI(imei: String){
        UserDefaults.standard.set(imei, forKey: StorageKeys.imei.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func subscribed(){
        UserDefaults.standard.set("1", forKey: StorageKeys.subscribed.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func saveSessionsWith(sessions: Int){
        UserDefaults.standard.set(sessions, forKey: StorageKeys.sessions.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func notificationsOn() {
        UserDefaults.standard.set("1", forKey: StorageKeys.notifications.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func notificationsOff() {
        UserDefaults.standard.removeObject(forKey: StorageKeys.notifications.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func notificationsAccepted() {
        UserDefaults.standard.set("1", forKey: StorageKeys.notificationsaccepted.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func onboarding(){
        UserDefaults.standard.set("1", forKey: StorageKeys.onboarding.rawValue)
        UserDefaults.standard.synchronize()
    }
    
}
