//
//  ChangePasswordWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ChangePasswordWireframe: ChangePasswordWireframeProtocol {
    
    
    static func createModule(ChangePasswordRef: ChangePasswordView) {
        let presenter: ChangePasswordPresenterProtocol & ChangePasswordOutputInteractorProtocol = ChangePasswordPresenter()
        ChangePasswordRef.presenter = presenter
        ChangePasswordRef.presenter?.wireframe = ChangePasswordWireframe()
        ChangePasswordRef.presenter?.view = ChangePasswordRef
        ChangePasswordRef.presenter?.interactor = ChangePasswordInteractor()
        ChangePasswordRef.presenter?.interactor?.presenter = presenter
        
    }
}
