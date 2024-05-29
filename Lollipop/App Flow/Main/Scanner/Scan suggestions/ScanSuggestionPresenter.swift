//
//  ScanSuggestionPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ScanSuggestionPresenter: NSObject, ScanSuggestionPresenterProtocol  {
    
    var interactor : ScanSuggestionInputInteractorProtocol?
    weak var view: ScanSuggestionViewProtocol?
    var wireframe: ScanSuggestionWireframeProtocol?
    
}

extension ScanSuggestionPresenter: ScanSuggestionOutputInteractorProtocol {
    
}


//MARK: UITableViewDelegate&Datasource
extension ScanSuggestionPresenter {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 7 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.scanSuggestionCell.rawValue, for: indexPath) as! ScanSuggestionTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 64))
        
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textAlignment = .left
        label.textColor = AppColors.black
        
        label.text = section == 0 ? LocalizedTitle.lollypopPartners.localized : LocalizedTitle.otherCards.localized
        
        headerView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(24)
        }
        headerView.backgroundColor = AppColors.lightGrey
        
        return headerView
    }
    
    func didSelectItemAt(index: IndexPath) {
    }
}
