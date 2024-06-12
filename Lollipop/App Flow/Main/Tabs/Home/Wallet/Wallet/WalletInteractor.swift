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
//        let cards = WalletWireframe.cards ?? []
//        presenter?.takeDataWith(cards: cards)
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getusercards { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseCardsDataWith(result: result)
        }
    }
    
    func getCardDetailsWith(alias: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getcarddetails(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseCardDetailsWith(result: result)
        }
    }
}
