//
//  LanguagePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LanguagePresenter: NSObject, LanguagePresenterProtocol  {
    
    var interactor : LanguageInputInteractorProtocol?
    weak var view: LanguageViewProtocol?
    var wireframe: LanguageWireframeProtocol?
    
    var datasource = [LanguageModel]()
    
    func viewDidLoad() {
        let source = DefaultModels().languageDatasource
        
        for i in 0..<source.count {
            var item = source[i]
            item.selected = item.lanCode.rawValue == Manager.selectedLanguageCode
            self.datasource.append(item)
        }
        self.view?.reload()
    }
}

extension LanguagePresenter: LanguageOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension LanguagePresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.lanCell.rawValue, for: indexPath) as! LanguageTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}
