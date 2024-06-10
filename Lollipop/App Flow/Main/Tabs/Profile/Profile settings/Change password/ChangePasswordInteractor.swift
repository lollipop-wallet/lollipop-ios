//
//  ChangePasswordInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ChangePasswordInteractor: ChangePasswordInputInteractorProtocol {
    
    weak var presenter: ChangePasswordOutputInteractorProtocol?
    
    func change(currentPassword: String, newPassword: String, newPasswordConfirmation: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.changepassword(oldPassword: currentPassword, newPassword: newPassword, newPasswordConfirmation: newPasswordConfirmation) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseChangedPasswordData(result: result)
        }
    }
}
