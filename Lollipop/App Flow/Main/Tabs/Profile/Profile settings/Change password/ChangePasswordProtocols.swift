//
//  ChangePasswordProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol ChangePasswordPresenterProtocol: AnyObject {
    
    var interactor: ChangePasswordInputInteractorProtocol? { get set }
    var view: ChangePasswordViewProtocol? { get set }
    var wireframe:ChangePasswordWireframeProtocol? { get set }
    
    func change(currentPassword: String, newPassword: String, newPasswordConfirmation: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ChangePasswordInputInteractorProtocol: AnyObject {
    
    var presenter: ChangePasswordOutputInteractorProtocol?  { get set }
    func change(currentPassword: String, newPassword: String, newPasswordConfirmation: String)
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ChangePasswordOutputInteractorProtocol: AnyObject {
    func parseChangedPasswordData(result: Result<ChangePasswordModel, AFError>)
}
//MARK: View
protocol ChangePasswordViewProtocol: AnyObject {
    
    var presenter: ChangePasswordPresenterProtocol?  { get set }
    func validate(isCurrendPwdEmpty: Bool, isNewPwdEmpty: Bool, isConfirmedPwdEmpty: Bool)

}
//MARK: Wireframe
protocol ChangePasswordWireframeProtocol: AnyObject {

    
}
