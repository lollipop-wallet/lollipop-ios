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
}
