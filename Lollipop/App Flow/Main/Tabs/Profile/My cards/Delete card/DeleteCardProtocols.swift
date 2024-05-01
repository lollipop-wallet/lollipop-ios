//
//  DeleteCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol DeleteCardPresenterProtocol: AnyObject {
    
    var interactor: DeleteCardInputInteractorProtocol? { get set }
    var view: DeleteCardViewProtocol? { get set }
    var wireframe:DeleteCardWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DeleteCardInputInteractorProtocol: AnyObject {
    
    var presenter: DeleteCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DeleteCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol DeleteCardViewProtocol: AnyObject {
    
    var presenter: DeleteCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol DeleteCardWireframeProtocol: AnyObject {

    
}
