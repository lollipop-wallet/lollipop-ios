//
//  LoginWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LoginWireframe: LoginWireframeProtocol {
    
    
    static func createModule(LoginRef: LoginView) {
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        LoginRef.presenter = presenter
        LoginRef.presenter?.wireframe = LoginWireframe()
        LoginRef.presenter?.view = LoginRef
        LoginRef.presenter?.interactor = LoginInteractor()
        LoginRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toNewUser(){
        let vc = RegisterView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
