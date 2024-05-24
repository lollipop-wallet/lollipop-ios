//
//  ForgotPwdEmailInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ForgotPwdEmailInteractor: ForgotPwdEmailInputInteractorProtocol {
    
    weak var presenter: ForgotPwdEmailOutputInteractorProtocol?
    
    func sendOtpWith(email: String) {
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.sendforgotpwdotp(email: email) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseOTPDataWith(result: result)
        }
    }
}
