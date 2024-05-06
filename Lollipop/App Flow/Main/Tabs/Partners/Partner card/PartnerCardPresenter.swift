//
//  PartnerCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardPresenter: NSObject, PartnerCardPresenterProtocol  {
    
    var interactor : PartnerCardInputInteractorProtocol?
    weak var view: PartnerCardViewProtocol?
    var wireframe: PartnerCardWireframeProtocol?
    
    var datasource = DefaultModels().partnerCardOptionsDatasource
}

extension PartnerCardPresenter: PartnerCardOutputInteractorProtocol {
    
}

extension PartnerCardPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerCardCell.rawValue, for: indexPath) as! PartnerCardTableViewCell
        cell.configureWith(model: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}
