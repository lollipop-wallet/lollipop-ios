//
//  LoginPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LoginPresenter: NSObject, LoginPresenterProtocol  {
    
    var interactor : LoginInputInteractorProtocol?
    weak var view: LoginViewProtocol?
    var wireframe: LoginWireframeProtocol?
    
    func register() {
        wireframe?.toNewUser()
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    
}

//MARK: InputField Delegate
extension LoginPresenter {
    func showHidePassword() {
        view?.setShowHidePassword()
    }
}
