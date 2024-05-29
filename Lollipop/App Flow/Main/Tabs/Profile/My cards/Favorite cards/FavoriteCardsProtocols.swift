//
//  FavoriteCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol FavoriteCardsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, FavoriteCardCellProtocol {
    
    var interactor: FavoriteCardsInputInteractorProtocol? { get set }
    var view: FavoriteCardsViewProtocol? { get set }
    var wireframe:FavoriteCardsWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol FavoriteCardsInputInteractorProtocol: AnyObject {
    
    var presenter: FavoriteCardsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol FavoriteCardsOutputInteractorProtocol: AnyObject {
    func takeData(cards: [Card], delegate: FavoriteControllerProtocol?)
}
//MARK: View
protocol FavoriteCardsViewProtocol: AnyObject {
    
    var presenter: FavoriteCardsPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol FavoriteCardsWireframeProtocol: AnyObject {
    static var cards: [Card]? { get set }
    static var delegate: FavoriteControllerProtocol? { get set }
}

//MARK: FavoriteCardCell Protocol
protocol FavoriteCardCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: FavoriteController protocol
protocol FavoriteControllerProtocol: AnyObject {
    func updateCardsWith(cards: [Card])
}
