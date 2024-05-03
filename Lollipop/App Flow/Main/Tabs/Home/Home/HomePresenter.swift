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
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCardCell.rawValue, for: indexPath) as! HomeCardTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCircleHorizontalCell.rawValue, for: indexPath) as! HomeCircleHorizontalCategoryTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homePosterCell.rawValue, for: indexPath) as! HomePosterCategoryTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeRectItemCell.rawValue, for: indexPath) as! HomeRectHorizontalCategoryTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }
    }
    
    func didTapAddCard() {
        
    }
    
    func didTapSeeMoreFromRectCategory(){
        wireframe?.toPromotions()
    }
}
