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
        interactor?.viewDidLoad()
    }
    
    func edit(){
        UIApplication.topViewController()?.openAlert(title: LocalizedTitle.sortCardBy.localized, message: "", alertStyle: .actionSheet, actionTitles: [LocalizedTitle.cardName.localized, LocalizedTitle.manually.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
            },
            { [weak self] _ in
                guard let self = self  else {return}
            },
            {_ in
                
            }
       ])
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
            print("Ima ih: ", self.datasource.count)
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
        wireframe?.toDetails()
    }
}
