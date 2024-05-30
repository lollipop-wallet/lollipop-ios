//
//  ReorderCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ReorderCardsPresenterProtocol: AnyObject {
    
    var interactor: ReorderCardsInputInteractorProtocol? { get set }
    var view: ReorderCardsViewProtocol? { get set }
    var wireframe:ReorderCardsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ReorderCardsInputInteractorProtocol: AnyObject {
    
    var presenter: ReorderCardsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ReorderCardsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ReorderCardsViewProtocol: AnyObject {
    
    var presenter: ReorderCardsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ReorderCardsWireframeProtocol: AnyObject {

}

//MARK: ReorderCardsController Protocol
protocol ReorderCardsControllerProtocol: AnyObject {
    func updateFavoriteCardsWith(cards: [Card])
}

//MARK: ReorderCardsCell Protocol
protocol ReorderCardsCellProtocol: AnyObject {
    
}
