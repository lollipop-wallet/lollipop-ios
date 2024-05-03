//
//  PromotionDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PromotionDetailsPresenterProtocol: AnyObject {
    
    var interactor: PromotionDetailsInputInteractorProtocol? { get set }
    var view: PromotionDetailsViewProtocol? { get set }
    var wireframe:PromotionDetailsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PromotionDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: PromotionDetailsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PromotionDetailsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PromotionDetailsViewProtocol: AnyObject {
    
    var presenter: PromotionDetailsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PromotionDetailsWireframeProtocol: AnyObject {

    
}
