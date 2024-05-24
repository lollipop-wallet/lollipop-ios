//
//  Alert.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.4.24..
//

import UIKit

class Alert {
    func alertMessage(title : String, text: String, shouldDismiss: Bool, nav: UINavigationController) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
            let okAction = UIAlertAction(title: LocalizedTitle.ok.localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
                if shouldDismiss{
                    nav.popViewController(animated: true)
                }
            }
            alertController.addAction(okAction)
            UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func alertMessageNoNavigator(title : String, text: String, shouldDismiss: Bool) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: text, preferredStyle: .alert)
            let okAction = UIAlertAction(title: LocalizedTitle.ok.localized, style: UIAlertAction.Style.default) {
                UIAlertAction in
                if shouldDismiss{
                    UIApplication.topViewController()?.dismiss(animated: true, completion: nil)
                }
            }
            alertController.addAction(okAction)
            UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
        }
    }
    
    func showSettingsAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if
            let settings = URL(string: UIApplication.openSettingsURLString),
            UIApplication.shared.canOpenURL(settings) {
            alert.addAction(UIAlertAction(title: LocalizedTitle.openSettings.localized, style: .default) { action in
                UIApplication.shared.open(settings)
            })
        }
        alert.addAction(UIAlertAction(title: LocalizedTitle.cancel.localized, style: .cancel) { action in
        })
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
    

}
