//
//  CardDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol CardDetailsPresenterProtocol: AnyObject {
    
    var interactor: CardDetailsInputInteractorProtocol? { get set }
    var view: CardDetailsViewProtocol? { get set }
    var wireframe:CardDetailsWireframeProtocol? { get set }
    
    func edit()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol CardDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: CardDetailsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol CardDetailsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol CardDetailsViewProtocol: AnyObject {
    
    var presenter: CardDetailsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol CardDetailsWireframeProtocol: AnyObject {
    func toEdit()
}
