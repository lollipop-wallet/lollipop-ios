//
//  AppDelegate+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import Firebase
import AppTrackingTransparency
import IQKeyboardManagerSwift
import Alamofire
import Localize_Swift
import FBSDKCoreKit
import IQKeyboardToolbarManager

// MARK: - AppDelegate
extension AppDelegate {
    /// Configuring Application when finishing launching
    /// - Parameter application: Main UIApplication
    func configureAppWith(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        //MARK: Localization setup
        if let lanCode = UserDefaults.standard.string(forKey: "lanCode"){
            Localize.setCurrentLanguage(lanCode)
            Manager.selectedLanguageCode = lanCode
        }else {
            Localize.setCurrentLanguage(LanCode.mne.rawValue)
            Manager.selectedLanguageCode = LanCode.mne.rawValue
        }
        
        //MARK: Check if user is registered/signed in or not
        if let token = UserDefaults.standard.string(forKey: StorageKeys.accessToken.rawValue){
            Manager.token = token
            Manager.isRegistered = true
        }else{
            Manager.isRegistered = false
        }

        //MARK: Defaults
        Manager.sessionsCount = 1
        
        let options = FirebaseOptions(contentsOfFile: Configuration.googlePlistFilePath)
        FirebaseApp.configure(options: options!)
        
        configureNotifications(application)

        // IQ keyboard manager
        configureKeyboardManager()

        //Session counter
        if let sessions = UserDefaults.standard.value(forKey: StorageKeys.sessions.rawValue) as? Int{
            let total = sessions + 1
            Manager.sessionsCount = total
            StorageManager().saveSessionsWith(sessions: total)
        }else{
            Manager.sessionsCount = 1
            StorageManager().saveSessionsWith(sessions: 1)
        }
        
        // Initialize Facebook SDK
        FBSDKCoreKit.ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
    }
    
    func configureKeyboardManager() {
        IQKeyboardManager.shared.isEnabled = true
        //IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss"
        IQKeyboardToolbarManager.shared.isEnabled = false
        IQKeyboardToolbarManager.shared.toolbarConfiguration.placeholderConfiguration.showPlaceholder = false
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
    
    func configureEntryPoint() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let launchView = LaunchView()
        //Manager.currentIndexOnMain = 0
        let navigationController = UINavigationController(rootViewController: launchView)
        //navigationController.isNavigationBarHidden = true
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    
    /// Configuring App When UIApplication Did Becoming Active
    func configureAppDidBecomeActive() {
        // Requesting App Tracking
        requestAppTracking()
    }
    
    func requestAppTracking() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { (status) in
                print("APP Tracking status is = \(status.rawValue)")
            }
        }
    }
}
