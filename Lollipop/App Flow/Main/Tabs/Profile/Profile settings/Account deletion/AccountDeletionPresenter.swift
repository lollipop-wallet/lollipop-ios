//
//  AccountDeletionPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class AccountDeletionPresenter: AccountDeletionPresenterProtocol  {
    
    var interactor : AccountDeletionInputInteractorProtocol?
    weak var view: AccountDeletionViewProtocol?
    var wireframe: AccountDeletionWireframeProtocol?
    
    func delete() {
        interactor?.delete()
    }
}

extension AccountDeletionPresenter: AccountDeletionOutputInteractorProtocol {
    func parseDeletedAccountData(result: Result<Empty, AFError>){
        switch result {
        case .success(_):
            Manager.token = ""
            Manager.isRegistered = false
            UserDefaults.standard.removeObject(forKey: StorageKeys.accessToken.rawValue)
            UserDefaults.standard.synchronize()
            wireframe?.toMain()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
