//
//  ForgotPwdEmailProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ForgotPwdEmailPresenterProtocol: AnyObject {
    
    var interactor: ForgotPwdEmailInputInteractorProtocol? { get set }
    var view: ForgotPwdEmailViewProtocol? { get set }
    var wireframe:ForgotPwdEmailWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ForgotPwdEmailInputInteractorProtocol: AnyObject {
    
    var presenter: ForgotPwdEmailOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ForgotPwdEmailOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ForgotPwdEmailViewProtocol: AnyObject {
    
    var presenter: ForgotPwdEmailPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ForgotPwdEmailWireframeProtocol: AnyObject {

    
}
