//
//  DisplayCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol DisplayCardPresenterProtocol: AnyObject {
    
    var interactor: DisplayCardInputInteractorProtocol? { get set }
    var view: DisplayCardViewProtocol? { get set }
    var wireframe:DisplayCardWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DisplayCardInputInteractorProtocol: AnyObject {
    
    var presenter: DisplayCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DisplayCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol DisplayCardViewProtocol: AnyObject {
    
    var presenter: DisplayCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol DisplayCardWireframeProtocol: AnyObject {

    
}
