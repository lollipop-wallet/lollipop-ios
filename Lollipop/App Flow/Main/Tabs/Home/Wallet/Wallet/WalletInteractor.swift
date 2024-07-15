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
    
    func viewDidLoad(showSpinner: Bool){
        let delegate = WalletWireframe.delegate
        let cardsDelegate = WalletWireframe.cardsDelegate
        if showSpinner {
            UIApplication.topViewController()?.view.showSpinner()
        }
        APIClient.getusercards { [weak self] result in
            if showSpinner {
                UIApplication.topViewController()?.view.hideSpinner()
            }
            guard let self = self else {return}
            self.presenter?.parseCardsDataWith(result: result, delegate: delegate, cardsDelegate: cardsDelegate)
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
    
    func viewDidLoadUnregistered(){
        let delegate = WalletWireframe.delegate
        let cardsDelegate = WalletWireframe.cardsDelegate
        presenter?.takeDataWith(delegate: delegate, cardsDelegate: cardsDelegate)
    }
}
