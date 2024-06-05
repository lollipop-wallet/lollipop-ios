//
//  PartnerCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PartnerCardInteractor: PartnerCardInputInteractorProtocol {
    
    weak var presenter: PartnerCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let cardTemplate = PartnerCardWireframe.cardTemplate
        let partner = PartnerCardWireframe.partner
        presenter?.takeData(cardTemplate: cardTemplate, partner: partner)
    }
}
