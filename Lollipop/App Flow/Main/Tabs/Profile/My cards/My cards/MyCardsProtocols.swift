//
//  MyCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol MyCardsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MyCardsCellProtocol, FavoriteCardsControllerProtocol, ReorderCardsControllerProtocol {
    
    var interactor: MyCardsInputInteractorProtocol? { get set }
    var view: MyCardsViewProtocol? { get set }
    var wireframe:MyCardsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func edit()
    func changeSegment(segment: Int)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol MyCardsInputInteractorProtocol: AnyObject {
    
    var presenter: MyCardsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MyCardsOutputInteractorProtocol: AnyObject {
    func parseCardsData(result: Result<[Card], AFError>)
}
//MARK: View
protocol MyCardsViewProtocol: AnyObject {
    
    var presenter: MyCardsPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol MyCardsWireframeProtocol: AnyObject {
    func toFavoriteCardsWith(cards: [Card], delegate: FavoriteCardsControllerProtocol?)
    func toReorderCardsWith(cards: [Card], delegate: ReorderCardsControllerProtocol?)
    func toDetails()
}

//MARK: MyCardsCell Protocol
protocol MyCardsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
