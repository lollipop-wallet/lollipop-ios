//
//  LoginProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol LoginPresenterProtocol: AnyObject {
    
    var interactor: LoginInputInteractorProtocol? { get set }
    var view: LoginViewProtocol? { get set }
    var wireframe:LoginWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LoginInputInteractorProtocol: AnyObject {
    
    var presenter: LoginOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LoginOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol LoginViewProtocol: AnyObject {
    
    var presenter: LoginPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol LoginWireframeProtocol: AnyObject {

    
}
