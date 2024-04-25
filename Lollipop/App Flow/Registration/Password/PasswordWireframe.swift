//
//  PasswordWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PasswordWireframe: PasswordWireframeProtocol {
    
    
    static func createModule(PasswordRef: PasswordView) {
        let presenter: PasswordPresenterProtocol & PasswordOutputInteractorProtocol = PasswordPresenter()
        PasswordRef.presenter = presenter
        PasswordRef.presenter?.wireframe = PasswordWireframe()
        PasswordRef.presenter?.view = PasswordRef
        PasswordRef.presenter?.interactor = PasswordInteractor()
        PasswordRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toOtp(){
        let vc = OTPView()
        let navVC = UINavigationController(rootViewController: vc)
        UIApplication.topViewController()?.present(navVC, animated: true)
    }
}
