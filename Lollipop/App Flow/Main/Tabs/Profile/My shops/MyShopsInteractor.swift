//
//  MyShopsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class MyShopsInteractor: MyShopsInputInteractorProtocol {
    
    weak var presenter: MyShopsOutputInteractorProtocol?
    
    func viewDidLoad() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getfavoriteshops { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseShopsData(result: result)
        }
    }
    
    func toggleFavoriteWith(alias: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.togglefavorite(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseFavoriteData(result: result)
        }
    }
}
