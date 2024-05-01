//
//  MyCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyCardsPresenter: NSObject, MyCardsPresenterProtocol  {
    
    var interactor : MyCardsInputInteractorProtocol?
    weak var view: MyCardsViewProtocol?
    var wireframe: MyCardsWireframeProtocol?
    
    func sort(){
        UIApplication.topViewController()?.openAlert(title: LocalizedTitle.sortCardBy.localized, message: "", alertStyle: .actionSheet, actionTitles: [LocalizedTitle.cardName.localized, LocalizedTitle.manually.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
            },
            { [weak self] _ in
                guard let self = self  else {return}
            },
            {_ in
                
            }
       ])
    }
}

extension MyCardsPresenter: MyCardsOutputInteractorProtocol {
    
}



//MARK: UITableViewDelegate&Datasource
extension MyCardsPresenter {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 7 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.myCardsCell.rawValue, for: indexPath) as! MyCardsTableViewCell
        cell.configureWith(index: indexPath, delegate: self, isEditing: false)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 64))
        
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textAlignment = .left
        label.textColor = AppColors.black
        
        label.text = section == 0 ? LocalizedTitle.handpickedCards.localized : LocalizedTitle.otherCards.localized
        
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
