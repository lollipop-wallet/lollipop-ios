//
//  PasswordProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PasswordPresenterProtocol: InputFieldProtocol {
    
    var interactor: PasswordInputInteractorProtocol? { get set }
    var view: PasswordViewProtocol? { get set }
    var wireframe:PasswordWireframeProtocol? { get set }
    
    func viewDidLoad()
    func proceed(password: String, confirmPassword: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PasswordInputInteractorProtocol: AnyObject {
    
    var presenter: PasswordOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func register(name: String, email: String, dob: String, gender: String, city: String, password: String, confirmPassword: String)
    func login(email: String, password: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PasswordOutputInteractorProtocol: AnyObject {
    func takeDataWith(firstName: String, lastName: String, email: String, dob: String, gender: String, city: String)
    func parseRegisterDataWith(result: Result<RegisterModel, AFError>)
    func parseLoginData(result: Result<LoginModel, AFError>)

}
//MARK: View
protocol PasswordViewProtocol: AnyObject {
    
    var presenter: PasswordPresenterProtocol?  { get set }
    func setShowHidePassword(tag: Int)
    func validate(isPwdEmpty: Bool, isConfirmPwdEmpty: Bool)

}
//MARK: Wireframe
protocol PasswordWireframeProtocol: AnyObject {
    static var firstName: String? { get set }
    static var lastName: String? { get set }
    static var email: String? { get set }
    static var gender: String? { get set }
    static var dob: String? { get set }
    static var city: String? { get set }

    func toOtp()
}
