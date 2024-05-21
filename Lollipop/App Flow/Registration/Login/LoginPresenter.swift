//
//  LoginPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class LoginPresenter: NSObject, LoginPresenterProtocol  {
    
    var interactor : LoginInputInteractorProtocol?
    weak var view: LoginViewProtocol?
    var wireframe: LoginWireframeProtocol?
    
    func register() {
        wireframe?.toNewUser()
    }
    
    func login(email: String, password: String){
        guard !email.isEmpty, !password.isEmpty else {
            view?.validate(isEmailEmpty: email.isEmpty, isPwdEmpty: password.isEmpty)
            return
        }
        interactor?.login(email: email, password: password)
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func parseLoginData(result: Result<LoginModel, AFError>){
        switch result {
        case .success(let model):
            print("success")
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: InputField Delegate
extension LoginPresenter {
    func showHidePassword() {
        view?.setShowHidePassword()
    }
}
