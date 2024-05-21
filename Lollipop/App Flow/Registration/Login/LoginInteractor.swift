//
//  LoginInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LoginInteractor: LoginInputInteractorProtocol {
    
    weak var presenter: LoginOutputInteractorProtocol?
    
    func login(email: String, password: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.login(email: email, password: password) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseLoginData(result: result)
        }
    }
}
