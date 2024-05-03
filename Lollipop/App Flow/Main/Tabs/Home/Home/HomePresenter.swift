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
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.addCardHomeCell.rawValue, for: indexPath) as! AddCardHomeTableViewCell
//        cell.configureWith(index: indexPath, delegate: self)
//        return cell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCardCell.rawValue, for: indexPath) as! HomeCardTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCircleHorizontalCell.rawValue, for: indexPath) as! HomeCircleHorizontalCategoryTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }
    }
    
    func didTapAddCard() {
        
    }
}
