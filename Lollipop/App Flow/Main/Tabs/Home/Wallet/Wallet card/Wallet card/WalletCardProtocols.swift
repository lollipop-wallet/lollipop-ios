//
//  WalletCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol WalletCardPresenterProtocol: UITableViewDelegate, UITableViewDataSource, WalletCardShopCellProtocol, CardDetailsControllerProtocol {
    
    var interactor: WalletCardInputInteractorProtocol? { get set }
    var view: WalletCardViewProtocol? { get set }
    var wireframe:WalletCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func locations()
    func details()
    func programme()
    func rules()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol WalletCardInputInteractorProtocol: AnyObject {
    
    var presenter: WalletCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol WalletCardOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?)
}
//MARK: View
protocol WalletCardViewProtocol: AnyObject {
    
    var presenter: WalletCardPresenterProtocol?  { get set }
    func setTitleWith(title: String)
    func setCardImageWith(image: String)
    func setBarcodeNumberWith(barcode: String)
    func setBarcodeImageWith(image: UIImage)
    func reload()
    func setQRCodeWith(image: UIImage)
    func setQRCodeHidden(isHidden: Bool)
    func setBarcodeHidden(isHidden: Bool)
    func setPlainNumberWith(plainNumber: String)
    func setPlainNumberHidden(isHidden: Bool)
}
//MARK: Wireframe
protocol WalletCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    func toLocations(partner: Partner?, brands: [Brand])
    func toCardDetails(card: Card?, delegate: CardDetailsControllerProtocol?)
    func toHTMLWith(title: String, description: String, buttonTitle: String, externalLink: String)
    func toBrandDetailsWith(alias: String?)
}

//MARK: WalletCardShopCell Protocol
protocol WalletCardShopCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
