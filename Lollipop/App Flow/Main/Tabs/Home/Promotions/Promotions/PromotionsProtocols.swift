//
//  PromotionsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PromotionsPresenterProtocol: AnyObject {
    
    var interactor: PromotionsInputInteractorProtocol? { get set }
    var view: PromotionsViewProtocol? { get set }
    var wireframe:PromotionsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PromotionsInputInteractorProtocol: AnyObject {
    
    var presenter: PromotionsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PromotionsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PromotionsViewProtocol: AnyObject {
    
    var presenter: PromotionsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PromotionsWireframeProtocol: AnyObject {

    
}
