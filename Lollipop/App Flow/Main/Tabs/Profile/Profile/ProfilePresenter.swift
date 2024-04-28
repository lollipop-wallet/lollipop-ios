//
//  ProfilePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfilePresenter: NSObject, ProfilePresenterProtocol  {
    
    var interactor : ProfileInputInteractorProtocol?
    weak var view: ProfileViewProtocol?
    var wireframe: ProfileWireframeProtocol?
    
    let datasource = DefaultModels().profileDatasource
    
    func favoriteShops(){
        wireframe?.toFavoriteShops()
    }
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension ProfilePresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.profileCell.rawValue, for: indexPath) as! ProfileTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        switch item.item {
        case .settings:
            wireframe?.toPersonalData()
        case .cards:
            wireframe?.toMyCards()
        case .about:
            wireframe?.toAbout()
        case .language:
            wireframe?.toLanguage()
        case .terms:
            wireframe?.toTerms()
        }
    }
}
