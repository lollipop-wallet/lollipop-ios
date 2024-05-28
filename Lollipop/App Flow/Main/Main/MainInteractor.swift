//
//  MainInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class MainInteractor: MainInputInteractorProtocol {
    
    weak var presenter: MainOutputInteractorProtocol?
    
    func getWalletCards() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getusercards { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseWalletCards(result: result)
        }
    }
}
