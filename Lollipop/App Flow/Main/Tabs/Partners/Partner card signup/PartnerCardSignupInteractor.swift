//
//  PartnerCardSignupInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PartnerCardSignupInteractor: PartnerCardSignupInputInteractorProtocol {
    
    weak var presenter: PartnerCardSignupOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = PartnerCardSignupWireframe.card
        presenter?.takeData(card: card)
    }
    
    func inquiry(name: String, city: String, phone: String, partnerAlias: String, email: String){
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.inquiry(name: name, city: city, phone: phone, partnerAlias: partnerAlias, email: email) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseInquiryData(result: result)
        }
    }
}
