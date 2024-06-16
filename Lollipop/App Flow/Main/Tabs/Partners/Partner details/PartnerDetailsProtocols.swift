//
//  PartnerDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire
import SafariServices

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerDetailsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MainPartnerCellProtocol, PartnerDetailsCardCellProtocol, PartnerDetailsOptionsCellProtocol, HomePosterCategoryCellProtocol, PartnerDetailsPromotionTableViewCellProtocol, PartnerDetailsCustomCellProtocol, SFSafariViewControllerDelegate {
    
    var interactor: PartnerDetailsInputInteractorProtocol? { get set }
    var view: PartnerDetailsViewProtocol? { get set }
    var wireframe:PartnerDetailsWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerDetailsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func getDetails(alias: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerDetailsOutputInteractorProtocol: AnyObject {
    func takeData(alias: String)
    func parseBrandDetailsData(result: Result<PartnerDetailsModel,AFError>)
}
//MARK: View
protocol PartnerDetailsViewProtocol: AnyObject {
    
    var presenter: PartnerDetailsPresenterProtocol?  { get set }
    func reload()
    func setFavoriteIconWith(icon: String)
}
//MARK: Wireframe
protocol PartnerDetailsWireframeProtocol: AnyObject {
    static var alias: String? { get set }
    func toPartnerCardWith(card: CardTemplate?, partner: Partner?)
    func toLocations(partner: Partner?, brands: [Brand])
    func openLinkWith(link: String, delegate: SFSafariViewControllerDelegate)
    func toHTMLWith(title: String, description: String, buttonTitle: String, externalLink: String)
    func toPromotions(partnerAlias: String?)
}

//MARK: MainPartnerCell Protocol
protocol MainPartnerCellProtocol: AnyObject {
    func getPartnerWith(alias: String, selectedIndex: Int)
}

//MARK: PartnerDetailsCardCell Protocol
protocol PartnerDetailsCardCellProtocol: AnyObject {
    func didSelectCardTemplateItemAt(index: IndexPath)
}

//MARK: PartnerDetailsOptionsCell Protocol
protocol PartnerDetailsOptionsCellProtocol: AnyObject {
    func didTapLocations()
    func didTapAbout()
    func didTapRules()
}

//MARK: PartnerDetailsCustomCell Protocol
protocol PartnerDetailsCustomCellProtocol: AnyObject {
    func didTapCustomLinkWith(link: String)
}

//MARK: MainPartnerCollectionCell Protocol
protocol MainPartnerCollectionCellProtocol: AnyObject {
    
}

//MARK: PartnerDetailsPromotionTableViewCell Protocol
protocol PartnerDetailsPromotionTableViewCellProtocol: AnyObject {
    func didTapSeeMoreFromPartnerDetailsCellCategory()
    func didTapBannerWith(banner: Banner?)
}

//MARK: PartnerDetailsPromotionCollectionViewCell Protocol
protocol PartnerDetailsPromotionCollectionViewCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
