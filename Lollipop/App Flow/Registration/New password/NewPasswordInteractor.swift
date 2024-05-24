//
//  NewPasswordInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewPasswordInteractor: NewPasswordInputInteractorProtocol {
    
    weak var presenter: NewPasswordOutputInteractorProtocol?
    
    func viewDidLoad() {
        let email = NewPasswordWireframe.email ?? ""
        let otp = NewPasswordWireframe.otp ?? ""
        self.presenter?.takeDataWith(email: email, otp: otp)
    }
}
