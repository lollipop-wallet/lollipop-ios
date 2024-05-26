//
//  PartnersProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnersPresenterProtocol: UICollectionViewDelegate, UICollectionViewDataSource, PartnersCellProtocol{
    
    var interactor: PartnersInputInteractorProtocol? { get set }
    var view: PartnersViewProtocol? { get set }
    var wireframe:PartnersWireframeProtocol? { get set }
    
    func viewDidLoad()
    func suggestPartner()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnersInputInteractorProtocol: AnyObject {

    var presenter: PartnersOutputInteractorProtocol?  { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnersOutputInteractorProtocol: AnyObject {
    func parsePartnersData(result: Result<[Brand], AFError>)
}
//MARK: View
protocol PartnersViewProtocol: AnyObject {
    
    var presenter: PartnersPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol PartnersWireframeProtocol: AnyObject {
    func toNewPartner()
    func toPartnerDetails()
}

//MARK: PartnersCell Protocol

protocol PartnersCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
 
