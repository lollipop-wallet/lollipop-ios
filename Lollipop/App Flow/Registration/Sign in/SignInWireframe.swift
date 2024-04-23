//
//  SignInWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class SignInWireframe: SignInWireframeProtocol {
    
    
    static func createModule(SignInRef: SignInView) {
        let presenter: SignInPresenterProtocol & SignInOutputInteractorProtocol = SignInPresenter()
        SignInRef.presenter = presenter
        SignInRef.presenter?.wireframe = SignInWireframe()
        SignInRef.presenter?.view = SignInRef
        SignInRef.presenter?.interactor = SignInInteractor()
        SignInRef.presenter?.interactor?.presenter = presenter
        
    }
}
