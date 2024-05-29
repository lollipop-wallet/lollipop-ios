//
//  FavoriteCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol FavoriteCardsPresenterProtocol: AnyObject {
    
    var interactor: FavoriteCardsInputInteractorProtocol? { get set }
    var view: FavoriteCardsViewProtocol? { get set }
    var wireframe:FavoriteCardsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol FavoriteCardsInputInteractorProtocol: AnyObject {
    
    var presenter: FavoriteCardsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol FavoriteCardsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol FavoriteCardsViewProtocol: AnyObject {
    
    var presenter: FavoriteCardsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol FavoriteCardsWireframeProtocol: AnyObject {

    
}
