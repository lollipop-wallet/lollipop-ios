//
//  DisplayCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DisplayCardInteractor: DisplayCardInputInteractorProtocol {
    
    weak var presenter: DisplayCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = DisplayCardWireframe.card
        presenter?.takeData(card: card)
    }
}
