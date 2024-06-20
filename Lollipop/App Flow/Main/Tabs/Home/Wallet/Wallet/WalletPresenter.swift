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
    var delegate: WalletControllerProtocol?
 
    func viewDidLoad() {
        DeleteCardWireframe.delegate = self
        DeleteCardWireframe.destination = .wallet
        if Manager.isRegistered {
            interactor?.viewDidLoad()
            self.view?.setRightBarButtonItems(shouldSetAddButton: true)
        }else{
            self.interactor?.viewDidLoadUnregistered()
            self.view?.setNoCardsViewHidden(isHidden: false)
            self.view?.setRightBarButtonItems(shouldSetAddButton: false)
        }
    }
    
    func allCards() {
        wireframe?.toMyCards()
    }
    
    func addCard(){
        if Manager.isRegistered {
            wireframe?.toCardSuggestions()
        }else{
            self.delegate?.toProfileTabFromWallet()
        }
    }
}

extension WalletPresenter: WalletOutputInteractorProtocol {
    func takeDataWith(delegate: WalletControllerProtocol?){
        self.delegate = delegate
    }
    
    func parseCardsDataWith(result: Result<[Card], AFError>, delegate: WalletControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let cards):
            let walletCards = cards.filter { ($0.is_favorite ?? 0) == 1 }
            self.datasource = walletCards
            self.view?.setCardsWith(cards: walletCards)
            self.view?.setAllCardsButtonHidden(isHidden: cards.count <= 5)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
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


//MARK: DeleteCardController delegate
extension WalletPresenter {
    func didDeleteCard() {
        interactor?.viewDidLoad()
    }
}
