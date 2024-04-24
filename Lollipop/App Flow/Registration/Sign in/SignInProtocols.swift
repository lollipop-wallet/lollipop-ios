//
//  SignInProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol SignInPresenterProtocol: AnyObject {
    
    var interactor: SignInInputInteractorProtocol? { get set }
    var view: SignInViewProtocol? { get set }
    var wireframe:SignInWireframeProtocol? { get set }
    
    func signInEmail()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol SignInInputInteractorProtocol: AnyObject {
    
    var presenter: SignInOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol SignInOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol SignInViewProtocol: AnyObject {
    
    var presenter: SignInPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol SignInWireframeProtocol: AnyObject {
    func toManualSignIn()
}
