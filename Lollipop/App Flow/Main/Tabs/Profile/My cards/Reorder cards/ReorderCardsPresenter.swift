//
//  ReorderCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ReorderCardsPresenter: NSObject, ReorderCardsPresenterProtocol  {
    
    var interactor : ReorderCardsInputInteractorProtocol?
    weak var view: ReorderCardsViewProtocol?
    var wireframe: ReorderCardsWireframeProtocol?
    
    var datasource = [Card]()
    var delegate: ReorderCardsControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func updateDatasourceWith(datasource: [Card]){
        self.datasource = datasource
        self.view?.reload()
    }
}

extension ReorderCardsPresenter: ReorderCardsOutputInteractorProtocol {
    func takeData(cards: [Card], delegate: ReorderCardsControllerProtocol?) {
        self.datasource = cards
        self.delegate = delegate
        self.view?.reload()
        self.view?.updateDatasource(cards: cards)
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
