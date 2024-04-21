//
//  RemoteConfigManager.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import Firebase
import Kingfisher
import FirebaseRemoteConfig


typealias CompletionWithError = ((Bool, Error?) -> ())

class RemoteConfigManager {
    
    static let sharedInstance = RemoteConfigManager()
    var expirationDuration: TimeInterval = 5 // 12hs of cache by default

    func loadDefaultValues() {
        let appDefaults: [String: Any?] = ["ab_plans": "A"]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
    }
    
    func activateDebugMode() {
      let settings = RemoteConfigSettings()
      // WARNING: Don't actually do this in production!
      settings.minimumFetchInterval = 0
      RemoteConfig.remoteConfig().configSettings = settings
    }
    

    func fetchConfig(completion: CompletionWithError? = nil) {
    //MARK: For dev only:
        //activateDebugMode()
        loadDefaultValues()
        
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: Configuration.remoteConfigCacheTimeInterval) { status, error in
        if status == .success {
            RemoteConfig.remoteConfig().activate { changed, error in
            }
        }else {
            //MARK: Error logging
            if let error = error {
                completion?(true, error)
            }
        }
            //MARK: Fetch values
                       
            //MARK: Complete closure
            completion?(true, nil)
      }
    }
    
    func parseValues() {
        let abParam = RemoteConfig.remoteConfig()["ab_plans"].stringValue ?? ""
        //Manager.abTestingParameter = abParam
    }
}
