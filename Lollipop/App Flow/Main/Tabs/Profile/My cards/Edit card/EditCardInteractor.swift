//
//  EditCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class EditCardInteractor: EditCardInputInteractorProtocol {
    
    weak var presenter: EditCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = EditCardWireframe.card
        let delegate = EditCardWireframe.delegate
        presenter?.takeData(card: card, delegate: delegate)
    }
    
    func updateCard(cardAlias: String, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String){
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.updateloyaltycard(cardAlias: cardAlias, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarcode, codeType: !cardBarcode.isEmpty ? CardCodeType.barcode.rawValue : CardCodeType.plaincode.rawValue, nameOnTheCard: nameOnCard, notes: note) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseUpdatedCardData(result: result)
        }
    }
    
    func updatedisplaycard(cardAlias: String, frontImage: Data, backImage: Data, cardName: String, cardNumber: String, cardBarCode: String, codeType: String, nameOnTheCard: String, note: String){
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.updatedisplaycard(cardAlias: cardAlias, frontImage: frontImage, backImage: backImage, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarCode, codeType: codeType, nameOnTheCard: nameOnTheCard, notes: note) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseUpdatedCardData(result: result)
        }
    }
}
