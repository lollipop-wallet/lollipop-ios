//
//  NewPasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPasswordPresenter: NSObject, NewPasswordPresenterProtocol  {
    
    var interactor : NewPasswordInputInteractorProtocol?
    weak var view: NewPasswordViewProtocol?
    var wireframe: NewPasswordWireframeProtocol?
    
    func proceed(password: String, confirmPassword: String){
        guard !password.isEmpty, !confirmPassword.isEmpty else {
            view?.validate(isPwdEmpty: password.isEmpty, isConfirmPwdEmpty: confirmPassword.isEmpty)
            return
        }
        if password != confirmPassword {
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.passwordsDontMatch.localized, shouldDismiss: false)
            return
        }
    }
}

extension NewPasswordPresenter: NewPasswordOutputInteractorProtocol {
    
}

//MARK: InputField Delegate
extension NewPasswordPresenter {
    func showHidePassword(tag: Int) {
        view?.setShowHidePassword(tag: tag)
    }
}
