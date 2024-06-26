//
//  ReorderCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class ReorderCardsPresenter: NSObject, ReorderCardsPresenterProtocol  {
    
    var interactor : ReorderCardsInputInteractorProtocol?
    weak var view: ReorderCardsViewProtocol?
    var wireframe: ReorderCardsWireframeProtocol?
    
    var datasource = [Card]()
    var reorderedDatasource = [Card]()
    var delegate: ReorderCardsControllerProtocol?
    var reorderParameters: String = ""
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func updateDatasourceWith(datasource: [Card]){
        self.reorderedDatasource = datasource
        var reorderedCards = [PositionModel]()
        var parameters = String()
        for i in 0..<datasource.count {
            let item = datasource[i]
            let card = PositionModel(alias: item.alias ?? "", position: i+1)
            reorderedCards.append(card)
        }
        var dictionary = [[String: String]]()
        
        for i in 0..<reorderedCards.count {
            let pos = reorderedCards[i]
            var object:[String:String] = [:]
            object["alias"] = pos.alias
            object["position"] = String(pos.position)
            dictionary.append(object)
        }
        
        let encoder = JSONEncoder()
        if let jsonData = try? encoder.encode(dictionary) {
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                let paramString = "{ \"cards\": \(jsonString)}"
                parameters = paramString
                self.reorderParameters = parameters
            }
        }
    }
    
    func save(){
        guard !self.reorderedDatasource.isEmpty else {
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.notReordered.localized, shouldDismiss: false)
            return
        }
        UIApplication.topViewController()?.view.showSpinner()
        interactor?.reorder(parameters: self.reorderParameters)
    }
}

extension ReorderCardsPresenter: ReorderCardsOutputInteractorProtocol {
    func takeData(cards: [Card], delegate: ReorderCardsControllerProtocol?) {
        self.datasource = cards
        self.delegate = delegate
        self.view?.reload()
        self.view?.updateDatasource(cards: cards)
    }
    
    func parseReorderCardsData(model: ReorderCardsModel){
        DispatchQueue.main.async {
            UIApplication.topViewController()?.view.hideSpinner()
        }
        Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: model.message ?? "", shouldDismiss: false)
        self.delegate?.updateFavoriteCardsWith(cards: self.reorderedDatasource)
    }
}

//MARK: UITableView Delegate&Datasource
extension ReorderCardsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.reorderCardCell.rawValue, for: indexPath) as! ReorderCardsTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
    }
}



extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
