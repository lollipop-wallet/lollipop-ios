//
//  PartnerDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerDetailsPresenter: NSObject, PartnerDetailsPresenterProtocol  {
    
    var interactor : PartnerDetailsInputInteractorProtocol?
    weak var view: PartnerDetailsViewProtocol?
    var wireframe: PartnerDetailsWireframeProtocol?
    
}

extension PartnerDetailsPresenter: PartnerDetailsOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension PartnerDetailsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.mainPartnerCell.rawValue, for: indexPath) as! MainPartnerTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
}
