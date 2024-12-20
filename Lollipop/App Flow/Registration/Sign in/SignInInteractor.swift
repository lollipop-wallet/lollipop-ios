//
//  SignInInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class SignInInteractor: SignInInputInteractorProtocol {
    
    weak var presenter: SignInOutputInteractorProtocol?
    
    func googleSignIn(token: String){
        UIApplication.root().view.showSpinner()
        APIClient.googlesignin(token: token) { [weak self] result in
            UIApplication.root().view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.takeData(result: result)
        }
    }
    
    func facebookSignIn(token: String){
        UIApplication.root().view.showSpinner()
        APIClient.facebooksignin(token: token) { [weak self] result in
            UIApplication.root().view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.takeData(result: result)
        }
    }
    
    func appleSignIn(token: String){
        UIApplication.root().view.showSpinner()
        APIClient.applesignin(token: token) { [weak self] result in
            UIApplication.root().view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.takeData(result: result)
        }
    }
}
