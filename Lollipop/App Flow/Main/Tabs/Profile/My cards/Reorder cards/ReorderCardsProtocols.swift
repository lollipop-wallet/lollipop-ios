//
//  ReorderCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol ReorderCardsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, ReorderCardsCellProtocol {
    
    var interactor: ReorderCardsInputInteractorProtocol? { get set }
    var view: ReorderCardsViewProtocol? { get set }
    var wireframe:ReorderCardsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func updateDatasourceWith(datasource: [Card])
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ReorderCardsInputInteractorProtocol: AnyObject {
    
    var presenter: ReorderCardsOutputInteractorProtocol?  { get set }
    
    func viewDidLoad()
    func reorder(parameters: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ReorderCardsOutputInteractorProtocol: AnyObject {
    func takeData(cards: [Card], delegate: ReorderCardsControllerProtocol?)
    func parseReorderCardsData(model: ReorderCardsModel)
}
//MARK: View
protocol ReorderCardsViewProtocol: AnyObject {
    
    var presenter: ReorderCardsPresenterProtocol?  { get set }
    func reload()
    func updateDatasource(cards: [Card])
}
//MARK: Wireframe
protocol ReorderCardsWireframeProtocol: AnyObject {
    static var cards: [Card]? { get set }
    static var delegate: ReorderCardsControllerProtocol? { get set }
}

//MARK: ReorderCardsController Protocol
protocol ReorderCardsControllerProtocol: AnyObject {
    func updateFavoriteCardsWith(cards: [Card])
}

//MARK: ReorderCardsCell Protocol
protocol ReorderCardsCellProtocol: AnyObject {
    
}
