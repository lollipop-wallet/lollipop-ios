//
//  PersonalDataPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PersonalDataPresenter: NSObject, PersonalDataPresenterProtocol  {
    
    var interactor : PersonalDataInputInteractorProtocol?
    weak var view: PersonalDataViewProtocol?
    var wireframe: PersonalDataWireframeProtocol?
    
    let datasource = DefaultModels().personalDataDatasource
}

extension PersonalDataPresenter: PersonalDataOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension PersonalDataPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.personalDataCell.rawValue, for: indexPath) as! PersonalDataTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        switch item.item {
        case .data:
            print()
        case .password:
            print()
        }
    }
}
