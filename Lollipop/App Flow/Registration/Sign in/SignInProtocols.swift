//
//  SignInProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire
import AuthenticationServices

//MARK: Presenter
// VIEW TO PRESENTER
protocol SignInPresenterProtocol: ASAuthorizationControllerDelegate {
    
    var interactor: SignInInputInteractorProtocol? { get set }
    var view: SignInViewProtocol? { get set }
    var wireframe:SignInWireframeProtocol? { get set }
    
    func signInEmail()
    func signInGoogle(vc: SignInView)
    func signInApple()
    func signInFacebook(vc: SignInView)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol SignInInputInteractorProtocol: AnyObject {
    
    var presenter: SignInOutputInteractorProtocol?  { get set }
    func googleSignIn(token: String)
    func facebookSignIn(token: String)
    func appleSignIn(token: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol SignInOutputInteractorProtocol: AnyObject {
    func takeData(result: Result<LoginModel, AFError>)
}
//MARK: View
protocol SignInViewProtocol: AnyObject {
    
    var presenter: SignInPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol SignInWireframeProtocol: AnyObject {
    func toManualSignIn()
    func toMain()
}
