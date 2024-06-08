//
//  DeleteCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class DeleteCardPresenter: DeleteCardPresenterProtocol  {
    
    var interactor : DeleteCardInputInteractorProtocol?
    weak var view: DeleteCardViewProtocol?
    var wireframe: DeleteCardWireframeProtocol?
    
    var delegate: DeleteCardControllerProtocol?
    var alias: String?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func delete() {
        interactor?.delete(alias: self.alias ?? "")
    }
}

extension DeleteCardPresenter: DeleteCardOutputInteractorProtocol {
    func takeData(delegate: DeleteCardControllerProtocol?, alias: String?){
        self.delegate = delegate
        self.alias = alias
    }
    
    func parseDeletedCardData(result: Result<DeleteCardModel, AFError>){
        switch result {
        case .success(let model):
            UIApplication.topViewController()?.openAlert(title: LocalizedTitle.notice.localized, message: model.message ?? "", alertStyle: .alert, actionTitles: [LocalizedTitle.ok.localized], actionColors: [.systemBlue], actionStyles: [.default], actions: [
                { [weak self] _ in
                    guard let self = self else {return}
                    self.delegate?.didDeleteCard()
                    UIApplication.topViewController()?.popBack(4)
                }
           ])
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
