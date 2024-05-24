//
//  NewPasswordWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPasswordWireframe: NewPasswordWireframeProtocol {
    
    static var email: String?
    static var otp: String? 
    
    static func createModule(NewPasswordRef: NewPasswordView) {
        let presenter: NewPasswordPresenterProtocol & NewPasswordOutputInteractorProtocol = NewPasswordPresenter()
        NewPasswordRef.presenter = presenter
        NewPasswordRef.presenter?.wireframe = NewPasswordWireframe()
        NewPasswordRef.presenter?.view = NewPasswordRef
        NewPasswordRef.presenter?.interactor = NewPasswordInteractor()
        NewPasswordRef.presenter?.interactor?.presenter = presenter
        
    }
}
