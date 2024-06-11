//
//  LanguagePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire
import Localize_Swift

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
    
    func save() {
        let selectedDatasource = self.datasource.filter { ($0.selected ?? false) }
        if !selectedDatasource.isEmpty {
            interactor?.updateLanWith(languageId: selectedDatasource.first?.id ?? 0)
        }
    }
}

extension LanguagePresenter: LanguageOutputInteractorProtocol {
    func parseUpdatedLanguageData(result: Result<LanguageModel, AFError>){
        switch result {
        case .success(let model):
            Localize.setCurrentLanguage(model.data?.language?.lanCode?.rawValue ?? "")
            UserDefaults.standard.set(model.data?.language?.lanCode?.rawValue ?? "", forKey: "lanCode")
            UserDefaults.standard.synchronize()
            self.view?.setTitleWith(title: LocalizedTitle.changeLanguage.localized)
            self.view?.setSubtitleWith(subtitle: LocalizedTitle.chooseAppLanguage.localized)
            self.view?.setSaveButtonTitleWith(title: LocalizedTitle.save.localized)
            self.view?.reload()
            UIApplication.topViewController()?.openAlert(title: LocalizedTitle.notice.localized, message: model.message ?? "", alertStyle: .alert, actionTitles: [LocalizedTitle.ok.localized], actionColors: [.systemBlue], actionStyles: [.default], actions: [
                { [weak self] _ in
                    guard let self = self  else {return}
                    self.wireframe?.toMain()
                }
           ])
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }

    }
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
