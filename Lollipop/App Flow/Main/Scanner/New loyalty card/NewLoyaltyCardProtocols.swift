//
//  NewLoyaltyCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewLoyaltyCardPresenterProtocol: AnyObject {
    
    var interactor: NewLoyaltyCardInputInteractorProtocol? { get set }
    var view: NewLoyaltyCardViewProtocol? { get set }
    var wireframe:NewLoyaltyCardWireframeProtocol? { get set }
    
    func camera(isFront: Bool)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewLoyaltyCardInputInteractorProtocol: AnyObject {
    
    var presenter: NewLoyaltyCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewLoyaltyCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol NewLoyaltyCardViewProtocol: AnyObject {
    
    var presenter: NewLoyaltyCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol NewLoyaltyCardWireframeProtocol: AnyObject {

    
}
