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
    
    func myShops(){
        wireframe?.toMyShops()
    }
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension ProfilePresenter {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.profileCell.rawValue, for: indexPath) as! ProfileTableViewCell
        cell.configureWith(item: self.datasource[indexPath.section][indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 32
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return CGFloat.leastNonzeroMagnitude
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.section][index.row]
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
        case .shops:
            wireframe?.toMyShops()
        }
    }
}
