//
//  MyCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class MyCardsPresenter: NSObject, MyCardsPresenterProtocol  {
    
    var interactor : MyCardsInputInteractorProtocol?
    weak var view: MyCardsViewProtocol?
    var wireframe: MyCardsWireframeProtocol?
    
    var datasource = [Card]()
    var allCards = [Card]()
    var favoriteCards = [Card]()
    var selectedSegment = Int()
    var selectedIndex = Int()
    var shouldUpdateHomeCards = Bool()
    var delegate: MyCardsControllerProtocol?
    
    func viewDidLoad() {
        DeleteCardWireframe.delegate = self
        DeleteCardWireframe.destination = .profile
        self.selectedSegment = 0
        interactor?.viewDidLoad(showSpinner: true)
    }
    
    func edit(){
        if self.selectedSegment == 0 {
            if self.allCards.count <= 5 {
                wireframe?.toReorderCardsWith(cards: self.favoriteCards, delegate: self)
            }else{
                wireframe?.toFavoriteCardsWith(cards: self.allCards, delegate: self)
            }
        }else{
            wireframe?.toReorderCardsWith(cards: self.favoriteCards, delegate: self)
        }
    }
    
    func changeSegment(segment: Int){
        self.selectedSegment = segment
        self.datasource = segment == 0 ? allCards : favoriteCards
        self.view?.reload()
    }
}

extension MyCardsPresenter: MyCardsOutputInteractorProtocol {
    func parseCardsData(result: Result<[Card], AFError>, delegate: MyCardsControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let cards):
            let favCards = cards.filter { ($0.is_favorite ?? 0) == 1}
            self.favoriteCards = favCards
            self.allCards = cards
            self.datasource = self.selectedSegment == 0 ? allCards : favoriteCards
            self.view?.reload()
            if self.shouldUpdateHomeCards {
                delegate?.updateUserCardsWith(cards: favCards)
                self.shouldUpdateHomeCards = false
            }
            self.view?.setSegmentedControlHidden(isHidden: cards.count <= 5)
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



//MARK: UITableViewDelegate&Datasource
extension MyCardsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.myCardsCell.rawValue, for: indexPath) as! MyCardsTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self, isEditing: false)
        return cell
    }

    
    func didSelectItemForDetailsAt(index: IndexPath) {
        self.selectedIndex = index.row
        let item = self.datasource[index.row]
        wireframe?.toDetails(card: item, delegate: self)
    }
    
    func didSelectItemForBarcodeAt(index: IndexPath) {
        self.selectedIndex = index.row
        let item = self.datasource[index.row]
        interactor?.getCardDetailsWith(alias: item.alias ?? "")
    }
}

//MARK: FavoriteCardsController delegate & ReorderCardsController delegate
extension MyCardsPresenter {
    func updateCardsWith(cards: [Card]) {
        let favCards = cards.filter { ($0.is_favorite ?? 0) == 1}
        self.favoriteCards = favCards
        self.allCards = cards
        self.datasource = cards
        self.view?.reload()
        self.delegate?.updateUserCardsWith(cards: favCards)
    }
    
    func updateFavoriteCardsWith(cards: [Card]) {
        self.favoriteCards = cards
        self.datasource = cards
        self.view?.reload()
        self.delegate?.updateUserCardsWith(cards: cards)
    }
}

//MARK: CardDetailsController delegate
extension MyCardsPresenter {
    func updateCards(){
        interactor?.viewDidLoad(showSpinner: false)
    }
    
    func updateCardWith(card: Card?) {}
}

//MARK: DeleteCardController delegate
extension MyCardsPresenter {
    func didDeleteCard() {
        self.shouldUpdateHomeCards = true
        self.interactor?.viewDidLoad(showSpinner: false)
    }
}
