//
//  WalletPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class WalletPresenter: NSObject, WalletPresenterProtocol  {
    
    var interactor : WalletInputInteractorProtocol?
    weak var view: WalletViewProtocol?
    var wireframe: WalletWireframeProtocol?
    
    var datasource = [Card]()
 
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func allCards() {
        wireframe?.toMyCards()
    }
    
    func addCard(){
        wireframe?.toCardSuggestions()
    }
}

extension WalletPresenter: WalletOutputInteractorProtocol {
    func takeDataWith(cards: [Card]) {
        self.datasource = cards
        self.view?.setCardsWith(cards: cards)
    }
    
    func parseCardDetailsWith(result: Result<Card, AFError>){
        switch result {
        case .success(let card):
            if card.cardType == .loyalty {
                wireframe?.toLoyaltyCardDetailsWith(card: card)
            }else{
                wireframe?.toDisplayCardDetailsWith(card: card)
            }
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

extension WalletPresenter {
    func didSelectLoyaltyCartAt(index: Int) {
        let item = datasource[index]
        interactor?.getCardDetailsWith(alias: item.alias ?? "")
    }
}
