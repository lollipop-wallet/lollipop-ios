//
//  PartnerDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerDetailsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MainPartnerCellProtocol, PartnerDetailsCardCellProtocol, PartnerDetailsOptionsCellProtocol, HomePosterCategoryCellProtocol, RectangleCategoryCellProtocol, PartnerDetailsCustomCellProtocol {
    
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
}
//MARK: Wireframe
protocol PartnerDetailsWireframeProtocol: AnyObject {
    static var alias: String? { get set }
}

//MARK: MainPartnerCell Protocol
protocol MainPartnerCellProtocol: AnyObject {
    
}

//MARK: PartnerDetailsCardCell Protocol
protocol PartnerDetailsCardCellProtocol: AnyObject {
    
}

//MARK: PartnerDetailsOptionsCell Protocol
protocol PartnerDetailsOptionsCellProtocol: AnyObject {
    
}

//MARK: PartnerDetailsCustomCell Protocol
protocol PartnerDetailsCustomCellProtocol: AnyObject {
    
}

//MARK: MainPartnerCollectionCell Protocol
protocol MainPartnerCollectionCellProtocol: AnyObject {
    
}
