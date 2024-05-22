//
//  RegisterWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class RegisterWireframe: RegisterWireframeProtocol {
    
    
    static func createModule(RegisterRef: RegisterView) {
        let presenter: RegisterPresenterProtocol & RegisterOutputInteractorProtocol = RegisterPresenter()
        RegisterRef.presenter = presenter
        RegisterRef.presenter?.wireframe = RegisterWireframe()
        RegisterRef.presenter?.view = RegisterRef
        RegisterRef.presenter?.interactor = RegisterInteractor()
        RegisterRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPWdWith(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String){
        let vc = PasswordView()
        PasswordWireframe.firstName = firstname
        PasswordWireframe.lastName = lastname
        PasswordWireframe.email = email
        PasswordWireframe.dob = dob
        PasswordWireframe.gender = gender
        PasswordWireframe.city = city
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
