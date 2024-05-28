//
//  WalletPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletPresenter: NSObject, WalletPresenterProtocol  {
    
    var interactor : WalletInputInteractorProtocol?
    weak var view: WalletViewProtocol?
    var wireframe: WalletWireframeProtocol?
    
    var datasource = [Card]()
 
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension WalletPresenter: WalletOutputInteractorProtocol {
    func takeDataWith(cards: [Card]) {
        self.datasource = cards
    }
}

extension WalletPresenter {
    func didSelectLoyaltyCartAt(index: Int) {
        wireframe?.toWalletCard()
    }
}
