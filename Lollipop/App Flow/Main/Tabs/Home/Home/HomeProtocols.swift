//
//  HomeProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol HomePresenterProtocol: UITableViewDelegate, UITableViewDataSource, AddCardHomeCellProtocol, HomeCardCellProtocol, CircledCategoryCellProtocol, HomePosterCategoryCellProtocol, RectangleCategoryCellProtocol, ProfileControllerProtocol, NewLoyaltyCardControllerProtocol{
    
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var wireframe:HomeWireframeProtocol? { get set }
    
    func viewDidLoad()
    func avatar()
    func add()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol HomeInputInteractorProtocol: AnyObject {
    
    var presenter: HomeOutputInteractorProtocol?  { get set }
    func viewDidLoad(showSpinner: Bool)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol HomeOutputInteractorProtocol: AnyObject {
    func parseHomeData(result: Result<HomeModel, AFError>, delegate: HomeControllerProtocol?)
}
//MARK: View
protocol HomeViewProtocol: AnyObject {
    
    var presenter: HomePresenterProtocol?  { get set }
    func reload()
    func setUserNameWith(name: String)
    func setUserAvatarWith(avatar: String)
}
//MARK: Wireframe
protocol HomeWireframeProtocol: AnyObject {
    static var delegate: HomeControllerProtocol? { get set }
    func toPromotions()
    func toPromotionDetailsWith(banner: Banner?)
    func toCardTemplates()
}

//MARK: HomeController protocol
protocol HomeControllerProtocol: AnyObject {
    func toPartnersTabFromHome()
    func toProfileTabFromHome()
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
    func didTapSeeMoreFromCircleCategory()
}

//MARK: HomePosterCategoryCell Protocol
protocol HomePosterCategoryCellProtocol: AnyObject {
    
}

//MARK: RectangleCategoryCell Protocol
protocol RectangleCategoryCellProtocol: AnyObject {
    func didTapSeeMoreFromRectCategory()
    func didTapBannerWith(banner: Banner?)
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
