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

// MARK: - AppDelegate
extension AppDelegate {
    /// Configuring Application when finishing launching
    /// - Parameter application: Main UIApplication
    func configureAppWith(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        //MARK: Defaults
        Manager.sessionsCount = 1
        
        // Firebase Configuration - extend this to take into consideration environments and different plist files
       //  let options = FirebaseOptions(contentsOfFile: Configuration.googlePlistFilePath)
       //  FirebaseApp.configure(options: options!)
        
        configureNotifications(application)

        // IQ keyboard manager
        IQKeyboardManager.shared.enable = true
        //IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss"
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.toolbarConfiguration.placeholderConfiguration.showPlaceholder = false
        IQKeyboardManager.shared.resignOnTouchOutside = true

        //Session counter
        if let sessions = UserDefaults.standard.value(forKey: StorageKeys.sessions.rawValue) as? Int{
            let total = sessions + 1
            Manager.sessionsCount = total
            StorageManager().saveSessionsWith(sessions: total)
        }else{
            Manager.sessionsCount = 1
            StorageManager().saveSessionsWith(sessions: 1)
        }
        
    }
    
    func configureEntryPoint() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let launchView = OnboardingView()
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
