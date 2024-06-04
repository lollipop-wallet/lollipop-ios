//
//  PartnerDetailsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PartnerDetailsInteractor: PartnerDetailsInputInteractorProtocol {
    
    weak var presenter: PartnerDetailsOutputInteractorProtocol?
    
    func viewDidLoad(){
        let alias = PartnerDetailsWireframe.alias ?? ""
        presenter?.takeData(alias: alias)
    }
    
    func getDetails(alias: String) {
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.getbranddetails(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else {return}
            presenter?.parseBrandDetailsData(result: result)
        }
    }
}
