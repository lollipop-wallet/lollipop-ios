//
//  ForgotPwdEmailProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol ForgotPwdEmailPresenterProtocol: AnyObject {
    
    var interactor: ForgotPwdEmailInputInteractorProtocol? { get set }
    var view: ForgotPwdEmailViewProtocol? { get set }
    var wireframe:ForgotPwdEmailWireframeProtocol? { get set }
    
    func proceed(email: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ForgotPwdEmailInputInteractorProtocol: AnyObject {
    
    var presenter: ForgotPwdEmailOutputInteractorProtocol?  { get set }
    func sendOtpWith(email: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ForgotPwdEmailOutputInteractorProtocol: AnyObject {
    func parseOTPDataWith(result: Result<ForgotPwdEmailModel, AFError>)
}
//MARK: View
protocol ForgotPwdEmailViewProtocol: AnyObject {
    
    var presenter: ForgotPwdEmailPresenterProtocol?  { get set }
    func validate(isEmailEmpty: Bool)

}
//MARK: Wireframe
protocol ForgotPwdEmailWireframeProtocol: AnyObject {
    func toOTPWith(email: String)
}
