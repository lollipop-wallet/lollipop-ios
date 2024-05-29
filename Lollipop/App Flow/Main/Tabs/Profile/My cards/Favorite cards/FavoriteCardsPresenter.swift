//
//  FavoriteCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class FavoriteCardsPresenter: NSObject, FavoriteCardsPresenterProtocol  {
    
    var interactor : FavoriteCardsInputInteractorProtocol?
    weak var view: FavoriteCardsViewProtocol?
    var wireframe: FavoriteCardsWireframeProtocol?
    
    var datasource = [Card]()
    var delegate: FavoriteCardsControllerProtocol?
    var selectedIndex = Int()

    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension FavoriteCardsPresenter: FavoriteCardsOutputInteractorProtocol {
    func takeData(cards: [Card], delegate: FavoriteCardsControllerProtocol?){
        self.datasource = cards
        self.delegate = delegate
        self.view?.reload()
    }
    
    func parseFavoriteData(result: Result<FavoriteCardsModel, AFError>){
        switch result {
        case .success(let model):
            self.datasource[self.selectedIndex].is_favorite = (model.favorite ?? 0)
            self.view?.reload()
            self.delegate?.updateCardsWith(cards: self.datasource)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}


//MARK: UITableView Delegate&Datasource
extension FavoriteCardsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.favoriteCardCell.rawValue, for: indexPath) as! FavoriteCardTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        self.selectedIndex = index.row
        interactor?.toggleFavoriteWith(alias: self.datasource[index.row].alias ?? "")
    }
}
