//
//  AccountDeletionInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class AccountDeletionInteractor: AccountDeletionInputInteractorProtocol {
    
    weak var presenter: AccountDeletionOutputInteractorProtocol?
    
    func delete() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.deleteaccount { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseDeletedAccountData(result: result)
        }
    }
}
