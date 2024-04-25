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
protocol PasswordPresenterProtocol: AnyObject {
    
    var interactor: PasswordInputInteractorProtocol? { get set }
    var view: PasswordViewProtocol? { get set }
    var wireframe:PasswordWireframeProtocol? { get set }
    
    func proceed()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PasswordInputInteractorProtocol: AnyObject {
    
    var presenter: PasswordOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PasswordOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PasswordViewProtocol: AnyObject {
    
    var presenter: PasswordPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PasswordWireframeProtocol: AnyObject {
    func toOtp()
}
