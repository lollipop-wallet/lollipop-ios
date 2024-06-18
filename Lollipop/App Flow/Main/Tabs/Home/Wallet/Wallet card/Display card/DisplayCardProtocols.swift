//
//  DisplayCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol DisplayCardPresenterProtocol: CardDetailsControllerProtocol {
    
    var interactor: DisplayCardInputInteractorProtocol? { get set }
    var view: DisplayCardViewProtocol? { get set }
    var wireframe:DisplayCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func details()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DisplayCardInputInteractorProtocol: AnyObject {
    
    var presenter: DisplayCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DisplayCardOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?)
}
//MARK: View
protocol DisplayCardViewProtocol: AnyObject {
    
    var presenter: DisplayCardPresenterProtocol?  { get set }
    func setTitleWith(title: String)
    func setCardFrontImageWith(image: String)
    func setCardBackImageWith(image: String)
    func setCardSerialNumberWith(serialNumber: String)
    func setBarcodeNumberWith(barcode: String)
    func setBarcodeImageWith(image: UIImage)
    func setBarcodeHidden(isHidden: Bool)
    func setCardNumberHidden(isHidden: Bool)
    func setQRCodeWith(image: UIImage)
    func setQRCodeHidden(isHidden: Bool)
}
//MARK: Wireframe
protocol DisplayCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    func toCardDetails(card: Card?, delegate: CardDetailsControllerProtocol?)
}
