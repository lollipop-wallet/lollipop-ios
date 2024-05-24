//
//  ForgotPwdEmailPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class ForgotPwdEmailPresenter: ForgotPwdEmailPresenterProtocol  {
    
    var interactor : ForgotPwdEmailInputInteractorProtocol?
    weak var view: ForgotPwdEmailViewProtocol?
    var wireframe: ForgotPwdEmailWireframeProtocol?
    
    var email = String()
    
    func proceed(email: String) {
        guard !email.isEmpty else {
            view?.validate(isEmailEmpty: email.isEmpty)
            return
        }
        self.email = email
        interactor?.sendOtpWith(email: email)
    }
}

extension ForgotPwdEmailPresenter: ForgotPwdEmailOutputInteractorProtocol {
    func parseOTPDataWith(result: Result<ForgotPwdEmailModel, AFError>){
        switch result {
        case .success(let model):
            print("success")
            wireframe?.toOTPWith(email: self.email)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
