//
//  ProfileSettingsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfileSettingsPresenter: NSObject, ProfileSettingsPresenterProtocol  {
    
    var interactor : ProfileSettingsInputInteractorProtocol?
    weak var view: ProfileSettingsViewProtocol?
    var wireframe: ProfileSettingsWireframeProtocol?
    
    let datasource = DefaultModels().personalDataDatasource

    func deleteAccount(){
        wireframe?.toAccountDeletion()
    }
}

extension ProfileSettingsPresenter: ProfileSettingsOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension ProfileSettingsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.profileSettingsCell.rawValue, for: indexPath) as! ProfileSettingsTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        switch item.item {
        case .data:
            wireframe?.toPersonalData()
        case .password:
            wireframe?.toChangePassword()
        }
    }
}
