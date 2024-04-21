//
//  PushNotificationsManager.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import Foundation
import FirebaseMessaging

extension AppDelegate {
    // MARK: - Functions
    /// Configuring Firebase Cloud Messaging (Push Notifications)
    /// - Parameter application: Main UIApplication
    func configureNotifications(_ application: UIApplication) {
        // Setting Apple's Notification Center delegate to self
        UNUserNotificationCenter.current().delegate = self
        // The notification elements we care about
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        // Register for remote notifications. This shows a permission dialog on first run, to show the dialog at a more appropriate time move this registration accordingly.
        UNUserNotificationCenter.current().requestAuthorization(options: options) { _, _ in }
        // It's important to call the registration function on the main thread. https://bit.ly/3oqSq0z
        DispatchQueue.main.async {
            application.registerForRemoteNotifications()
        }
        UIApplication.shared.applicationIconBadgeNumber = 0
        // Setting the Firebase Messaging delegate to self so that we are getting all the information to this wrapper class
        Messaging.messaging().delegate = self
    }
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        process(notification)
        completionHandler([[.alert, .badge, .sound]])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        process(response.notification)
        completionHandler()
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().setAPNSToken(deviceToken, type: .unknown)
        Messaging.messaging().apnsToken = deviceToken
        //Subscribing to topic for notifications
        Messaging.messaging().subscribe(toTopic: Manager.userIMEI) { error in
            print("Ovo je moj topic: ", Manager.userIMEI)
            print("Greska je moja: ", error?.localizedDescription ?? "")
            if UserDefaults().string(forKey: StorageKeys.notificationsaccepted.rawValue) == nil {
//                StorageManager.sharedInstance.notificationsOn()
//                StorageManager.sharedInstance.notificationsAccepted()
            }
        }
    }
    

    private func process(_ notification: UNNotification) {
        let userInfo = notification.request.content.userInfo
        UIApplication.shared.applicationIconBadgeNumber = 0
        Messaging.messaging().appDidReceiveMessage(userInfo)
    }
}

// MARK: - MessagingDelegate
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        let tokenDict = ["token": fcmToken ?? ""]
        print("Token = \(tokenDict)")
    }
}
