//
//  PasswordInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PasswordInteractor: PasswordInputInteractorProtocol {
    
    weak var presenter: PasswordOutputInteractorProtocol?
    
    func viewDidLoad() {
        let firstName = PasswordWireframe.firstName ?? ""
        let lastName = PasswordWireframe.lastName ?? ""
        let email = PasswordWireframe.email ?? ""
        let dob = PasswordWireframe.dob ?? ""
        let gender = PasswordWireframe.gender ?? ""
        let city = PasswordWireframe.city ?? ""
        self.presenter?.takeDataWith(firstName: firstName, lastName: lastName, email: email, dob: dob, gender: gender, city: city)
    }
    
    func register(name: String, email: String, dob: String, gender: String, city: String, password: String, confirmPassword: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.register(name: name, email: email, dob: dob, gender: gender, city: city, password: password, confirmPassword: confirmPassword) { [weak self] result in
            guard let self = self else { return }
            presenter?.parseRegisterDataWith(result: result)
        }
    }
    
    func login(email: String, password: String) {
        APIClient.login(email: email, password: password) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseLoginData(result: result)
        }
    }
}
