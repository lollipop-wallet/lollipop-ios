//
//  HomeProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire
import SafariServices

//MARK: Presenter
// VIEW TO PRESENTER
protocol HomePresenterProtocol: UITableViewDelegate, UITableViewDataSource, AddCardHomeCellProtocol, HomeCardCellProtocol, CircledCategoryCellProtocol, HomePosterCategoryCellProtocol, RectangleCategoryCellProtocol, ProfileControllerProtocol, NewLoyaltyCardControllerProtocol, SFSafariViewControllerDelegate, PartnersCardControllerProtocol, WalletCardsUpdaterProtocol{
    
    var interactor: HomeInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var wireframe:HomeWireframeProtocol? { get set }
    
    func viewDidLoad()
    func avatar()
    func add()
    func localNotification()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol HomeInputInteractorProtocol: AnyObject {
    
    var presenter: HomeOutputInteractorProtocol?  { get set }
    func viewDidLoad(showSpinner: Bool)
    func getCardDetailsWith(alias: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol HomeOutputInteractorProtocol: AnyObject {
    func parseHomeData(result: Result<HomeModel, AFError>, delegate: HomeControllerProtocol?)
    func parseCardDetailsWith(result: Result<Card, AFError>)
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
    func toCardTemplates()
    func toLoyaltyCardDetailsWith(card: Card?)
    func toDisplayCardDetailsWith(card: Card?)
    func toBrandDetailsWith(alias: String?)
    func openLink(link: String, delegate: SFSafariViewControllerDelegate)
    func toHTMLWith(title: String, description: String, buttonTitle: String, externalLink: String)
    func toCards()
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
    func didSelectCard(card: Card?)
    func didTapSeeAllCards()
}

//MARK: CircledCategoryCell Protocol
protocol CircledCategoryCellProtocol: AnyObject {
    func didTapSeeMoreFromCircleCategory()
    func didSelectBrandWith(brand: Brand?)
}

//MARK: HomePosterCategoryCell Protocol
protocol HomePosterCategoryCellProtocol: AnyObject {
    func didTapPosterWith(index: IndexPath)
    func didTapPosterBrandWith(index: IndexPath)
}

//MARK: RectangleCategoryCell Protocol
protocol RectangleCategoryCellProtocol: AnyObject {
    func didTapSeeMoreFromRectCategory()
    func didTapBannerWith(banner: Banner?)
}

//MARK: LoyaltyCardCell protocol
protocol LoyaltyCardCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
    func didTapSeeAllCards()
}

//MARK: CircledItemCell Protocol
protocol CircledItemCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: RectItemCell Protocol
protocol RectItemCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
