//
//  PasswordProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PasswordPresenterProtocol: InputFieldProtocol {
    
    var interactor: PasswordInputInteractorProtocol? { get set }
    var view: PasswordViewProtocol? { get set }
    var wireframe:PasswordWireframeProtocol? { get set }
    
    func viewDidLoad()
    func proceed()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PasswordInputInteractorProtocol: AnyObject {
    
    var presenter: PasswordOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PasswordOutputInteractorProtocol: AnyObject {
    func takeDataWith(firstName: String, lastName: String, email: String, dob: String, gender: String, city: String)
}
//MARK: View
protocol PasswordViewProtocol: AnyObject {
    
    var presenter: PasswordPresenterProtocol?  { get set }
    func setShowHidePassword(tag: Int)

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
