//
//  PartnerCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerCardPresenterProtocol: UITableViewDelegate, UITableViewDataSource,  PartnerCardOptionCellProtocol{
    
    var interactor: PartnerCardInputInteractorProtocol? { get set }
    var view: PartnerCardViewProtocol? { get set }
    var wireframe:PartnerCardWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerCardInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerCardOutputInteractorProtocol: AnyObject {
    func takeData(cardTemplate: CardTemplate?, partner: Partner?)
}
//MARK: View
protocol PartnerCardViewProtocol: AnyObject {
    
    var presenter: PartnerCardPresenterProtocol?  { get set }
    func setCardImageWith(imageLink: String)
}
//MARK: Wireframe
protocol PartnerCardWireframeProtocol: AnyObject {
    static var cardTemplate: CardTemplate? { get set }
    static var partner: Partner? { get set }
    func toPartnerNewCard(card: Card?)
    func toScannerWith(card: Card?)
}

//MARK: PartnerCardOptionCellProtocol
protocol PartnerCardOptionCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
