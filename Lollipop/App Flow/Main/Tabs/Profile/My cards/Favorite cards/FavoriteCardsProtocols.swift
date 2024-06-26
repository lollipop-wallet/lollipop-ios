//
//  FavoriteCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

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
    func toggleFavoriteWith(alias: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol FavoriteCardsOutputInteractorProtocol: AnyObject {
    func takeData(cards: [Card], delegate: FavoriteCardsControllerProtocol?)
    func parseFavoriteData(result: Result<FavoriteCardsModel, AFError>)
}
//MARK: View
protocol FavoriteCardsViewProtocol: AnyObject {
    
    var presenter: FavoriteCardsPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol FavoriteCardsWireframeProtocol: AnyObject {
    static var cards: [Card]? { get set }
    static var delegate: FavoriteCardsControllerProtocol? { get set }
}

//MARK: FavoriteCardCell Protocol
protocol FavoriteCardCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: FavoriteController protocol
protocol FavoriteCardsControllerProtocol: AnyObject {
    func updateCardsWith(cards: [Card])
}
