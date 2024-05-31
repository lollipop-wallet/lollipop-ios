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
        presenter?.takeDataWith(card: card, barcode: barcode)
    }
}
