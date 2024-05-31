//
//  NewLoyaltyCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import PhotosUI


//MARK: Presenter
// VIEW TO PRESENTER
protocol NewLoyaltyCardPresenterProtocol: PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var interactor: NewLoyaltyCardInputInteractorProtocol? { get set }
    var view: NewLoyaltyCardViewProtocol? { get set }
    var wireframe:NewLoyaltyCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func camera(isFront: Bool)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewLoyaltyCardInputInteractorProtocol: AnyObject {
    
    var presenter: NewLoyaltyCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewLoyaltyCardOutputInteractorProtocol: AnyObject {
    func takeDataWith(card: Card?, barcode: String)
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
}
//MARK: Wireframe
protocol NewLoyaltyCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    static var barcode: String? { get set }
}
