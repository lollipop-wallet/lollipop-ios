//
//  PartnersInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PartnersInteractor: PartnersInputInteractorProtocol {
    
    weak var presenter: PartnersOutputInteractorProtocol?
    
    func viewDidLoad() {
        let delegate = PartnersWireframe.delegate
        
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getbrands { [weak self] result in
            guard let self = self else {return}
            self.presenter?.parsePartnersData(result: result, delegate: delegate)
        }
    }
    
    func getFavoriteParnters() {
        APIClient.getfavoritebrands { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseFavoritePartnersData(result: result)
        }
    }
}
