//
//  ForgotPwdEmailWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ForgotPwdEmailWireframe: ForgotPwdEmailWireframeProtocol {
    
    
    static func createModule(ForgotPwdEmailRef: ForgotPwdEmailView) {
        let presenter: ForgotPwdEmailPresenterProtocol & ForgotPwdEmailOutputInteractorProtocol = ForgotPwdEmailPresenter()
        ForgotPwdEmailRef.presenter = presenter
        ForgotPwdEmailRef.presenter?.wireframe = ForgotPwdEmailWireframe()
        ForgotPwdEmailRef.presenter?.view = ForgotPwdEmailRef
        ForgotPwdEmailRef.presenter?.interactor = ForgotPwdEmailInteractor()
        ForgotPwdEmailRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toOTPWith(email: String){
        let vc = OTPView()
        OTPWireframe.email = email
        OTPWireframe.otpType = .resetpwd
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
