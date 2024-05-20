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
protocol NewPasswordPresenterProtocol: AnyObject {
    
    var interactor: NewPasswordInputInteractorProtocol? { get set }
    var view: NewPasswordViewProtocol? { get set }
    var wireframe:NewPasswordWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewPasswordInputInteractorProtocol: AnyObject {
    
    var presenter: NewPasswordOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewPasswordOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol NewPasswordViewProtocol: AnyObject {
    
    var presenter: NewPasswordPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol NewPasswordWireframeProtocol: AnyObject {

    
}
