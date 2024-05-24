//
//  NewPasswordProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewPasswordPresenterProtocol: InputFieldProtocol {
    
    var interactor: NewPasswordInputInteractorProtocol? { get set }
    var view: NewPasswordViewProtocol? { get set }
    var wireframe:NewPasswordWireframeProtocol? { get set }
    
    func viewDidLoad()
    func proceed(password: String, confirmPassword: String)

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewPasswordInputInteractorProtocol: AnyObject {
    
    var presenter: NewPasswordOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewPasswordOutputInteractorProtocol: AnyObject {
    func takeDataWith(email: String, otp: String)
}
//MARK: View
protocol NewPasswordViewProtocol: AnyObject {
    
    var presenter: NewPasswordPresenterProtocol?  { get set }
    func setShowHidePassword(tag: Int)
    func validate(isPwdEmpty: Bool, isConfirmPwdEmpty: Bool)
}
//MARK: Wireframe
protocol NewPasswordWireframeProtocol: AnyObject {
    static var email: String? { get set }
    static var otp: String? { get set }
}
