//
//  RegisterInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class RegisterInteractor: RegisterInputInteractorProtocol {
    
    weak var presenter: RegisterOutputInteractorProtocol?
    
    func register(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String) {
        UIApplication.topViewController()?.view.showSpinner()
    }
}
