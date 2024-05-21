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
}