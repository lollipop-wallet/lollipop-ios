//
//  NewUserWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewUserWireframe: NewUserWireframeProtocol {
    
    
    static func createModule(NewUserRef: NewUserView) {
        let presenter: NewUserPresenterProtocol & NewUserOutputInteractorProtocol = NewUserPresenter()
        NewUserRef.presenter = presenter
        NewUserRef.presenter?.wireframe = NewUserWireframe()
        NewUserRef.presenter?.view = NewUserRef
        NewUserRef.presenter?.interactor = NewUserInteractor()
        NewUserRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPWd(){
        let vc = PasswordView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
