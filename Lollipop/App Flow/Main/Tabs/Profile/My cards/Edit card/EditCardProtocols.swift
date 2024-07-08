//
//  EditCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire
import CropViewController
import Photos
import PhotosUI

//MARK: Presenter
// VIEW TO PRESENTER
protocol EditCardPresenterProtocol: PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CropViewControllerDelegate {
    
    var interactor: EditCardInputInteractorProtocol? { get set }
    var view: EditCardViewProtocol? { get set }
    var wireframe:EditCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func delete()
    func save(frontImage: UIImage, backImage: UIImage, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol EditCardInputInteractorProtocol: AnyObject {
    
    var presenter: EditCardOutputInteractorProtocol?  { get set }
    
    func viewDidLoad()
    func updateCard(cardAlias: String, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String)
    func updatedisplaycard(cardAlias: String, frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, codeType: String, nameOnTheCard: String, note: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol EditCardOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?, delegate: EditCardControllerProtocol?)
    func parseUpdatedCardData(result: Result<EditCardModel, AFError>)
}
//MARK: View
protocol EditCardViewProtocol: AnyObject {
    var presenter: EditCardPresenterProtocol?  { get set }
    func setFrontCardImageWith(image: String)
    func setBackCardImageWith(image: String)
    func setCardNameWith(name: String)
    func setBarcodeWith(barcode: String)
    func setCardNumberWith(number: String)
    func setNameOnTheCardWith(nameOnTheCard: String)
    func setNotesWith(notes: String)
    func setFrontCameraControlHidden(isHidden: Bool)
    func setBackCameraControlHidden(isHidden: Bool)
    func validate(cardNameIsEmpty: Bool, cardCodeIsEmpty: Bool)
    func validate(cardNameIsEmpty: Bool)
    func setFrontCardImageWith(image: UIImage, isFront: Bool)
}
//MARK: Wireframe
protocol EditCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    static var delegate: EditCardControllerProtocol? { get set }
    func toDelete(alias: String)
    func toCropViewControllerWith(image: UIImage, delegate: CropViewControllerDelegate)
}

//MARK: EditCardController protocol
protocol EditCardControllerProtocol: AnyObject {
    func updateCardWith(card: Card?)
}
