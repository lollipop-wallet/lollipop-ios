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
    
    var datasource = [Language]()
    
    func viewDidLoad() {
        let source = Config.model.languages ?? []
        let finalSource = source.filter { ($0.locale ?? "") == "me" || ($0.locale ?? "") == "en" }
        
        for i in 0..<finalSource.count {
            var item = finalSource[i]
            item.selected = item.lanCode?.rawValue == Manager.selectedLanguageCode
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
        self.datasource.indices.forEach { self.datasource[$0].selected = false }
        var item = self.datasource[index.row]
        item.selected = true
        self.datasource[index.row] = item
        self.view?.reload()
    }
}
