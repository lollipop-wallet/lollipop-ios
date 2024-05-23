//
//  PasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

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
    var password = String()
    var userId = Int()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed(password: String, confirmPassword: String){
        guard !password.isEmpty, !confirmPassword.isEmpty else {
            view?.validate(isPwdEmpty: password.isEmpty, isConfirmPwdEmpty: confirmPassword.isEmpty)
            return
        }
        if password != confirmPassword {
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.passwordsDontMatch.localized, shouldDismiss: false)
            return
        }
        self.password = password
        interactor?.register(name: "\(self.firstName) \(self.lastName)", email: self.email, dob: self.dob, gender: self.gender, city: self.city, password: password, confirmPassword: confirmPassword)
        //wireframe?.toOtp()
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
    
    func parseRegisterDataWith(result: Result<RegisterModel, AFError>){
        switch result {
        case .success(let model):
            print("success")
            interactor?.login(email: self.email, password: self.password)
        case .failure(let error):
            UIApplication.topViewController()?.view.hideSpinner()
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
    
    func parseLoginData(result: Result<LoginModel, AFError>){
        switch result {
        case .success(let model):
            print("success")
            Manager.token = model.token ?? ""
            self.userId = model.id ?? 0
        case .failure(let error):
            UIApplication.topViewController()?.view.hideSpinner()
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: InputField Delegate
extension PasswordPresenter {
    func showHidePassword(tag: Int) {
        view?.setShowHidePassword(tag: tag)
    }
}
