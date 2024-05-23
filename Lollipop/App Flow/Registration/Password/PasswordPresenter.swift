//
//  PasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PasswordPresenter:NSObject, PasswordPresenterProtocol  {
    
    var interactor : PasswordInputInteractorProtocol?
    weak var view: PasswordViewProtocol?
    var wireframe: PasswordWireframeProtocol?
    
    var firstName = String()
    var lastName = String()
    var email = String()
    var dob = String()
    var gender = String()
    var city = String()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed() {
        wireframe?.toOtp()
    }
}

extension PasswordPresenter: PasswordOutputInteractorProtocol {
    func takeDataWith(firstName: String, lastName: String, email: String, dob: String, gender: String, city: String){
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dob = dob
        self.gender = gender
        self.city = city
    }
}

//MARK: InputField Delegate
extension PasswordPresenter {
    func showHidePassword(tag: Int) {
        view?.setShowHidePassword(tag: tag)
    }
}
