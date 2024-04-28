//
//  ChangePasswordProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ChangePasswordPresenterProtocol: AnyObject {
    
    var interactor: ChangePasswordInputInteractorProtocol? { get set }
    var view: ChangePasswordViewProtocol? { get set }
    var wireframe:ChangePasswordWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ChangePasswordInputInteractorProtocol: AnyObject {
    
    var presenter: ChangePasswordOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ChangePasswordOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ChangePasswordViewProtocol: AnyObject {
    
    var presenter: ChangePasswordPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ChangePasswordWireframeProtocol: AnyObject {

    
}
