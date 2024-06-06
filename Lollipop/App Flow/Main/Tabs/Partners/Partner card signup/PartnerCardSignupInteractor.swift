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
}
