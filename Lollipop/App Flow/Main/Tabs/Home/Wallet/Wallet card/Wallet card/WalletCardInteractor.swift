//
//  WalletCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class WalletCardInteractor: WalletCardInputInteractorProtocol {

    weak var presenter: WalletCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = WalletCardWireframe.card
        presenter?.takeData(card: card)
    }
}
