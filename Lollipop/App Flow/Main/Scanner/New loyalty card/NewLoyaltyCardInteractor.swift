//
//  NewLoyaltyCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewLoyaltyCardInteractor: NewLoyaltyCardInputInteractorProtocol {
    
    weak var presenter: NewLoyaltyCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = NewLoyaltyCardWireframe.card
        let barcode = NewLoyaltyCardWireframe.barcode ?? ""
        let isFromTemplate = NewLoyaltyCardWireframe.isFromTemplate ?? false
        presenter?.takeDataWith(card: card, barcode: barcode, isFromTemplate: isFromTemplate)
    }
    
    func createCard(cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String, partnerAlias: String, cardTemplateId: Int){
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.createloyaltycard(cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarcode, nameOnTheCard: nameOnCard, codeType: !cardBarcode.isEmpty ? CardCodeType.barcode.rawValue : CardCodeType.plaincode.rawValue, note: note, partnerAlias: partnerAlias, templateId: String(cardTemplateId)) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseNewCardData(result: result)
        }
    }
}
