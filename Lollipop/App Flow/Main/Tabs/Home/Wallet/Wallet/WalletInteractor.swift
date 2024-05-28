//
//  WalletInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class WalletInteractor: WalletInputInteractorProtocol {
    
    weak var presenter: WalletOutputInteractorProtocol?
    
    func viewDidLoad() {
        let cards = WalletWireframe.cards ?? []
        presenter?.takeDataWith(cards: cards)
    }
}
