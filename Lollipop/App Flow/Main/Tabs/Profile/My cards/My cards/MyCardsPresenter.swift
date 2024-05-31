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
    
    func viewDidLoad() {
        self.selectedSegment = 0
        interactor?.viewDidLoad()
    }
    
    func edit(){
        if self.selectedSegment == 0 {
            wireframe?.toFavoriteCardsWith(cards: self.allCards, delegate: self)
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
    func parseCardsData(result: Result<[Card], AFError>){
        switch result {
        case .success(let cards):
            let favCards = cards.filter { ($0.is_favorite ?? 0) == 1}
            self.favoriteCards = favCards
            self.allCards = cards
            self.datasource = cards
            self.view?.reload()
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

    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        wireframe?.toDetails(card: item, delegate: self)
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
    }
    
    func updateFavoriteCardsWith(cards: [Card]) {
        self.favoriteCards = cards
        self.datasource = cards
        self.view?.reload()
    }
}

//MARK: CardDetailsController delegate
extension MyCardsPresenter {
    
}
