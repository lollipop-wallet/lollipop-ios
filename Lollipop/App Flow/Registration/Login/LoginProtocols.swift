//
//  LoginProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol LoginPresenterProtocol: InputFieldProtocol {
    
    var interactor: LoginInputInteractorProtocol? { get set }
    var view: LoginViewProtocol? { get set }
    var wireframe:LoginWireframeProtocol? { get set }
    
    func register()
    func login(email: String, password: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LoginInputInteractorProtocol: AnyObject {
    
    var presenter: LoginOutputInteractorProtocol?  { get set }
    func login(email: String, password: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LoginOutputInteractorProtocol: AnyObject {
    func parseLoginData(result: Result<LoginModel, AFError>)
}
//MARK: View
protocol LoginViewProtocol: AnyObject {
    
    var presenter: LoginPresenterProtocol?  { get set }
    func setShowHidePassword()
    func validate(isEmailEmpty: Bool, isPwdEmpty: Bool)
}
//MARK: Wireframe
protocol LoginWireframeProtocol: AnyObject {
    func toNewUser()
}
