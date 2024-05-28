//
//  NewPartnerInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NewPartnerInteractor: NewPartnerInputInteractorProtocol {
    
    weak var presenter: NewPartnerOutputInteractorProtocol?
    
    func send(shopName: String, country: String, city: String, address: String, note: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.suggestshop(name: shopName, country: country, city: city, address: address, description: note) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            presenter?.parseSuggestionResult(result: result)
        }
    }
}
