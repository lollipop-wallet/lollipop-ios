//
//  DisplayCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import AVFoundation
import RSBarcodes_Swift

class DisplayCardPresenter: NSObject, DisplayCardPresenterProtocol  {
    
    var interactor : DisplayCardInputInteractorProtocol?
    weak var view: DisplayCardViewProtocol?
    var wireframe: DisplayCardWireframeProtocol?
    
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func details() {
        wireframe?.toCardDetails(card: self.card, delegate: self)
    }
}

extension DisplayCardPresenter: DisplayCardOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.name ?? "")
        self.view?.setCardFrontImageWith(image: card?.image_front ?? "")
        self.view?.setCardBackImageWith(image: card?.image_back ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
        let barcode = RSUnifiedCodeGenerator.shared.generateCode(card?.code ?? "", machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
        let image = RSAbstractCodeGenerator.resizeImage(barcode ?? UIImage(), targetSize: CGSize(width: UIScreen.main.bounds.width - 20, height: 80), contentMode: UIView.ContentMode.center) ?? UIImage()
        self.view?.setBarcodeImageWith(image: image)
        self.view?.setCardSerialNumberWith(serialNumber: card?.cardNumber ?? "")
        self.view?.setCardNumberHidden(isHidden: (card?.cardNumber ?? "").isEmpty)
        self.view?.setBarcodeHidden(isHidden: card?.isBarcodeImageHidden ?? false)
        self.view?.setQRCodeHidden(isHidden: card?.isQRImageHidden ?? false)
        if card?.cardCodeType == .qrcode {
            let qrImage = card?.code?.generateQRCode() ?? UIImage()
            self.view?.setQRCodeWith(image: qrImage)
        }
    }
}

//MARK: CardDetailsController delegate
extension DisplayCardPresenter {
    func updateCards(){}
    
    func updateCardWith(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.name ?? "")
        self.view?.setCardFrontImageWith(image: card?.image_front ?? "")
        self.view?.setCardBackImageWith(image: card?.image_back ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
        let barcode = RSUnifiedCodeGenerator.shared.generateCode(card?.code ?? "", machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
        let image = RSAbstractCodeGenerator.resizeImage(barcode ?? UIImage(), targetSize: CGSize(width: UIScreen.main.bounds.width - 20, height: 80), contentMode: UIView.ContentMode.center) ?? UIImage()
        self.view?.setBarcodeImageWith(image: image)
        self.view?.setCardSerialNumberWith(serialNumber: card?.cardNumber ?? "")
        self.view?.setCardNumberHidden(isHidden: (card?.cardNumber ?? "").isEmpty)
        self.view?.setBarcodeHidden(isHidden: card?.isBarcodeImageHidden ?? false)
        self.view?.setQRCodeHidden(isHidden: card?.isQRImageHidden ?? false)
        if card?.cardCodeType == .qrcode {
            let qrImage = card?.code?.generateQRCode() ?? UIImage()
            self.view?.setQRCodeWith(image: qrImage)
        }
    }
}
