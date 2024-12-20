//
//  ScannerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import BarcodeScanner

class ScannerPresenter: NSObject, ScannerPresenterProtocol  {
    
    var interactor : ScannerInputInteractorProtocol?
    weak var view: ScannerViewProtocol?
    var wireframe: ScannerWireframeProtocol?
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func manually(){
        wireframe?.toNewCardWith(card: self.card, barcode: "")
    }
}

extension ScannerPresenter: ScannerOutputInteractorProtocol {
    func takeDataWith(card: Card?){
        self.card = card
    }
}

//MARK: Barcodescanner delegate
extension ScannerPresenter {
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        if (self.card?.name ?? "").isEmpty {
            if type.contains("QRCode") {
                let cardTemplate = CardTemplate(id: 0, name: "", image_front: "", image_back: "", code_type: CardCodeType.qrcode.rawValue, cta_links_to: "", terms_conditions_url: "")
                let card = Card(id: 0, name: "", alias: "", name_on_card: "", image_front: "", image_back: "", code: "", cardNumber: "", note: "", type: "", is_favorite: 0, card_template: cardTemplate, partner: nil, position: 0, code_type: CardCodeType.qrcode.rawValue, customer_code: "", isSeeAllCards: false)
                wireframe?.toNewCardWith(card: card, barcode: code)
            }else {
                print("Acojle")
                let cardTemplate = CardTemplate(id: 0, name: "", image_front: "", image_back: "", code_type: CardCodeType.barcode.rawValue, cta_links_to: "", terms_conditions_url: "")
                let card = Card(id: 0, name: "", alias: "", name_on_card: "", image_front: "", image_back: "", code: "", cardNumber: "", note: "", type: "", is_favorite: 0, card_template: cardTemplate, partner: nil, position: 0, code_type: CardCodeType.barcode.rawValue, customer_code: "", isSeeAllCards: false)
                wireframe?.toNewCardWith(card: card, barcode: code)
            }
        }else{
            let cardTemplate = CardTemplate(id: 0, name: "", image_front: "", image_back: "", code_type: card?.code_type ?? "", cta_links_to: "", terms_conditions_url: "")
            self.card?.card_template = cardTemplate
            wireframe?.toNewCardWith(card: self.card, barcode: code)
        }
    }
    
    func scanner(_ controller: BarcodeScanner.BarcodeScannerViewController, didReceiveError error: any Error) {
    }
    
    func scannerDidDismiss(_ controller: BarcodeScanner.BarcodeScannerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
