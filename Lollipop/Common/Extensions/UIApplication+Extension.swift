//
//  UIApplication+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

extension UIApplication {
    class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
//            if let selected = tab.selectedViewController {
//                return topViewController(selected)
//            }
            return tab
        }
        
        if let split = viewController as? UISplitViewController {
            return topViewController(split.viewControllers[1])
        }
        
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
    
    class func root() -> UIViewController {
        let keyWindow = UIApplication.shared.keyWindow
        return keyWindow?.rootViewController ?? UIViewController()
    }
    
    class func rootNav() -> UIViewController{
        let keyWindow = UIApplication.shared.keyWindow
        if let nav = keyWindow?.rootViewController as? UINavigationController {
            return nav
        }else{
            return keyWindow?.rootViewController ?? UIViewController()
        }
    }
    
    var keyWindow: UIWindow? {
        return self.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
    }
    
    static var appVersion: String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }
    
    static var cleanVersion: String {
        return "\(appVersion)".replacingOccurrences(of: ".", with: "")
    }
    
    private class func _share(_ data: [Any],
                              applicationActivities: [UIActivity]?,
                              setupViewControllerCompletion: ((UIActivityViewController) -> Void)?) {
        let activityViewController = UIActivityViewController(activityItems: data, applicationActivities: nil)
        setupViewControllerCompletion?(activityViewController)
        UIApplication.topViewController()?.present(activityViewController, animated: true, completion: nil)
    }

    class func share(_ data: Any...,
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
    class func share(_ data: [Any],
                     applicationActivities: [UIActivity]? = nil,
                     setupViewControllerCompletion: ((UIActivityViewController) -> Void)? = nil) {
        _share(data, applicationActivities: applicationActivities, setupViewControllerCompletion: setupViewControllerCompletion)
    }
}
