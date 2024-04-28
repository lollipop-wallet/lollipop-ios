//
//  AccountDeletionProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol AccountDeletionPresenterProtocol: AnyObject {
    
    var interactor: AccountDeletionInputInteractorProtocol? { get set }
    var view: AccountDeletionViewProtocol? { get set }
    var wireframe:AccountDeletionWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol AccountDeletionInputInteractorProtocol: AnyObject {
    
    var presenter: AccountDeletionOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol AccountDeletionOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol AccountDeletionViewProtocol: AnyObject {
    
    var presenter: AccountDeletionPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol AccountDeletionWireframeProtocol: AnyObject {

    
}
