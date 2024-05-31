//
//  CardDetailsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class CardDetailsInteractor: CardDetailsInputInteractorProtocol {
    
    weak var presenter: CardDetailsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = CardDetailsWireframe.card
        let delegate = CardDetailsWireframe.delegate
        presenter?.takeData(card: card, delegate: delegate)
    }
}
