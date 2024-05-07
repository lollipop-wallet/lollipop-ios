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
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.mainPartnerCell.rawValue, for: indexPath) as! MainPartnerTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.parnterDetailsCardCell.rawValue, for: indexPath) as! PartnerDetailsCardTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsOptionsCell.rawValue, for: indexPath) as! PartnerDetailsOptionsTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }
    }
}
