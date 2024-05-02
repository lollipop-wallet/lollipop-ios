//
//  HomePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HomePresenter: NSObject, HomePresenterProtocol  {
    
    var interactor : HomeInputInteractorProtocol?
    weak var view: HomeViewProtocol?
    var wireframe: HomeWireframeProtocol?
    
    func viewDidLoad() {
        
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    
}

extension HomePresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.addCardHomeCell.rawValue, for: indexPath) as! AddCardHomeTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didTapAddCard() {
        
    }
}
