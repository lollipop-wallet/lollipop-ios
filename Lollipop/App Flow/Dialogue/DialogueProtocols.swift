//
//  DialogueProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol DialoguePresenterProtocol: AnyObject {
    
    var interactor: DialogueInputInteractorProtocol? { get set }
    var view: DialogueViewProtocol? { get set }
    var wireframe:DialogueWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DialogueInputInteractorProtocol: AnyObject {
    
    var presenter: DialogueOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DialogueOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol DialogueViewProtocol: AnyObject {
    
    var presenter: DialoguePresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol DialogueWireframeProtocol: AnyObject {

    
}
