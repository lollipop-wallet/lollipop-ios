//
//  NewPasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class NewPasswordPresenter: NSObject, NewPasswordPresenterProtocol  {
    
    var interactor : NewPasswordInputInteractorProtocol?
    weak var view: NewPasswordViewProtocol?
    var wireframe: NewPasswordWireframeProtocol?
    
    var email = String()
    var otp = String()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed(password: String, confirmPassword: String){
        guard !password.isEmpty, !confirmPassword.isEmpty else {
            view?.validate(isPwdEmpty: password.isEmpty, isConfirmPwdEmpty: confirmPassword.isEmpty)
            return
        }
        if password != confirmPassword {
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.passwordsDontMatch.localized, shouldDismiss: false)
            return
        }
        interactor?.changePassword(email: self.email, otp: self.otp, password: password, confirmPassword: confirmPassword)
    }
}

extension NewPasswordPresenter: NewPasswordOutputInteractorProtocol {
    func takeDataWith(email: String, otp: String){
        self.email = email
        self.otp = otp
    }
    
    func parseChangePwdData(result: Result<NewPasswordModel, AFError>){
        switch result {
        case .success(let model):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: model.message ?? "", shouldDismiss: true)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: InputField Delegate
extension NewPasswordPresenter {
    func showHidePassword(tag: Int) {
        view?.setShowHidePassword(tag: tag)
    }
}
