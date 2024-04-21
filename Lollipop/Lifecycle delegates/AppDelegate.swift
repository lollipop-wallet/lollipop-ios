//
//  AppDelegate.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        configureAppWith(application, didFinishLaunchingWithOptions: launchOptions)
        
        configureEntryPoint()
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // App DidBecomeActive
        configureAppDidBecomeActive()
    }

}
