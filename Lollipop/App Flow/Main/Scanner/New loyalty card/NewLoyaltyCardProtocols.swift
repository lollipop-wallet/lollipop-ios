//
//  NewLoyaltyCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import PhotosUI
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewLoyaltyCardPresenterProtocol: PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var interactor: NewLoyaltyCardInputInteractorProtocol? { get set }
    var view: NewLoyaltyCardViewProtocol? { get set }
    var wireframe:NewLoyaltyCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func camera(isFront: Bool)
    func save(frontImage: UIImage, backImage: UIImage, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String)

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewLoyaltyCardInputInteractorProtocol: AnyObject {
    
    var presenter: NewLoyaltyCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func createCard(cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String, partnerAlias: String, cardTemplateId: Int)
    func createDisplayCarad(frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, nameOnTheCard: String, note: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewLoyaltyCardOutputInteractorProtocol: AnyObject {
    func takeDataWith(card: Card?, barcode: String, isFromTemplate: Bool, delegate: NewLoyaltyCardControllerProtocol?)
    func parseNewCardData(result: Result<NewLoyaltyCardModel, AFError>)
}
//MARK: View
protocol NewLoyaltyCardViewProtocol: AnyObject {
    
    var presenter: NewLoyaltyCardPresenterProtocol?  { get set }
    func setFrontCardImageWith(image: UIImage, isFront: Bool)
    
    func setFrontCardImageWith(image: String)
    func setBackCardImageWith(image: String)
    func setCardNameWith(name: String)
    func setBarcodeWith(barcode: String)
    func setFrontCameraControlHidden(isHidden: Bool)
    func setBackCameraControlHidden(isHidden: Bool)
    func validate(cardNameIsEmpty: Bool, cardCodeIsEmpty: Bool)

}
//MARK: Wireframe
protocol NewLoyaltyCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    static var barcode: String? { get set }
    static var isFromTemplate: Bool? { get set }
    static var delegate: NewLoyaltyCardControllerProtocol? { get set }
    func toMain()
}


//MARK: NewLoyaltyCardController Protocol

protocol NewLoyaltyCardControllerProtocol: AnyObject {
    func reload()
}
