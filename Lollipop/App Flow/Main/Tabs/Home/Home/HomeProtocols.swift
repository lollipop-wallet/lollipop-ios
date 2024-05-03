//
//  HomeProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol HomePresenterProtocol: UITableViewDelegate, UITableViewDataSource, AddCardHomeCellProtocol, HomeCardCellProtocol, CircledCategoryCellProtocol, HomePosterCategoryCellProtocol, RectangleCategoryCellProtocol {
    
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var wireframe:HomeWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol HomeInputInteractorProtocol: AnyObject {
    
    var presenter: HomeOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol HomeOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol HomeViewProtocol: AnyObject {
    
    var presenter: HomePresenterProtocol?  { get set }
}
//MARK: Wireframe
protocol HomeWireframeProtocol: AnyObject {
    func toPromotions()
}

//MARK: AddCardHomeCell protocol
protocol AddCardHomeCellProtocol: AnyObject {
    func didTapAddCard()
}

//MARK: HomeCardCell protocol
protocol HomeCardCellProtocol: AnyObject {
    
}

//MARK: CircledCategoryCell Protocol
protocol CircledCategoryCellProtocol: AnyObject {
    
}

//MARK: HomePosterCategoryCell Protocol
protocol HomePosterCategoryCellProtocol: AnyObject {
    
}

//MARK: RectangleCategoryCell Protocol
protocol RectangleCategoryCellProtocol: AnyObject {
    func didTapSeeMoreFromRectCategory()
}

//MARK: LoyaltyCardCell protocol
protocol LoyaltyCardCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: CircledItemCell Protocol
protocol CircledItemCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: RectItemCell Protocol
protocol RectItemCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
