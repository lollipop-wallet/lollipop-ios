//
//  MyShopsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class MyShopsPresenter: NSObject, MyShopsPresenterProtocol  {
    
    var interactor : MyShopsInputInteractorProtocol?
    weak var view: MyShopsViewProtocol?
    var wireframe: MyShopsWireframeProtocol?
    var delegate: MyShopsControllerProtocol?
    
    var datasource = [Brand]()
    var selectedIndex = Int()
    
    func viewDidLoad(){
        interactor?.viewDidLoad()
    }
}

extension MyShopsPresenter: MyShopsOutputInteractorProtocol {
    func parseShopsData(result: Result<MyShopsModel, AFError>, delegate: MyShopsControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let model):
            self.datasource = model.data ?? []
            self.view?.reload()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
    
    func parseFavoriteData(result: Result<SetToFavoriteModel, AFError>){
        switch result {
        case .success(let model):
            self.datasource[self.selectedIndex].is_favorite = (model.favorite ?? 0)
            self.view?.reload()
            self.delegate?.favoriteShopsUpdated(brands: self.datasource)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UITableViewDelegate&Datasource
extension MyShopsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.myShopsCell.rawValue, for: indexPath) as! MyShopsTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        self.selectedIndex = index.row
        interactor?.toggleFavoriteWith(alias: self.datasource[index.row].alias ?? "")
    }
}
