//
//  EditCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol EditCardPresenterProtocol: AnyObject {
    
    var interactor: EditCardInputInteractorProtocol? { get set }
    var view: EditCardViewProtocol? { get set }
    var wireframe:EditCardWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol EditCardInputInteractorProtocol: AnyObject {
    
    var presenter: EditCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol EditCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol EditCardViewProtocol: AnyObject {
    
    var presenter: EditCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol EditCardWireframeProtocol: AnyObject {

    
}
