//
//  Configuration.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit
import FittedSheets
import KeychainSwift

struct Configuration {
    
    
    //MARK: API config
    static var productionServerBaseURL: String {
        get {
            #if PROD
                return "https://lollipop.strangehollow.cc/api/"
            #else
                return "https://lollipop.strangehollow.cc/api/"
            #endif
        }
    }

    static let currentAPIVersion = "v1.9/"
    
    //MARK: RemoteConfig config
    static var remoteConfigCacheTimeInterval: TimeInterval {
        get {
            #if PROD
                return 1800
            #else
                return 5
            #endif
        }
    }
        
    
    //MARK: AppStore config
    static var appStoreId: String {
        get {
            #if PROD
                return "6446428782"
            #else
                return "6446428747"
            #endif
        }
    }
    
    static var appStoreURL: String {
        get {
            #if PROD
                return "https://apps.apple.com/us/app/avatarai-prod/id6446428782"
            #else
                return "https://apps.apple.com/us/app/avatarai-dev/id6446428747"
            #endif
        }
    }
    
    
    //MARK: Firebase GooglePlist path config
    static var googlePlistFilePath: String {
        get {
            #if PROD
                return Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")!
            #else
                return Bundle.main.path(forResource: "GoogleService-Info-Dev", ofType: "plist")!
            #endif
        }
    }
    
    //MARK: Static loyalty card type
    static let loyaltyType = "loyalty"
    
    //MARK: Current app id
    static let currentAppId = "1"
    
    //MARK: Current app version
    static let currentAppVersion = "1.9"

    //MARK: AppName
    static let appName = "Lollipop"
    
    //MARK: Keychain pwd
    static let keychainKey = "lollipopAppKeychainPassword"
    
    //MARK: AppKey for encryption
    static let appKeyEncrypt = "lollipop"
    
    
    //MARK: Privacy and Terms config
    static let privacyPolicy = "https://prettyboamedia.com/secondphone-privacy/"
    
    static let terms = "https://prettyboamedia.com/terms-conditions/"
    
    //MARK: VersionUpdate config
    let softwareUpdate = "App-prefs:General&path=SOFTWARE_UPDATE_LINK"
    
    //MARK: BottomSheet Options
    let options = SheetOptions(
        // The full height of the pull bar. The presented view controller will treat this area as a safearea inset on the top
        pullBarHeight: 0,
        // The corner radius of the shrunken presenting view controller
        presentingViewCornerRadius: 13,
        // Extends the background behind the pull bar or not
        shouldExtendBackground: true,
        // Attempts to use intrinsic heights on navigation controllers. This does not work well in combination with keyboards without your code handling it.
        setIntrinsicHeightOnNavigationControllers: true,
        // Pulls the view controller behind the safe area top, especially useful when embedding navigation controllers
        useFullScreenMode: true,
        // Shrinks the presenting view controller, similar to the native modal
        shrinkPresentingViewController: false,
        // Determines if using inline mode or not
        useInlineMode: false,
        // Adds a padding on the left and right of the sheet with this amount. Defaults to zero (no padding)
        horizontalPadding: 0,
        // Sets the maximum width allowed for the sheet. This defaults to nil and doesn't limit the width.
        maxWidth: nil
    )
}


struct SystemInfo {
    static let iOSVersion = UIDevice.current.systemVersion
    static let deviceVendorID = UIDevice.current.identifierForVendor?.uuidString
    static let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    static let email = "support@prettyboamedia.com"
}
