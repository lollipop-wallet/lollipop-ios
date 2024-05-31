//
//  ScannerInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ScannerInteractor: ScannerInputInteractorProtocol {
    
    weak var presenter: ScannerOutputInteractorProtocol?
    
    func viewDidLoad() {
        let card = ScannerWireframe.card
        presenter?.takeDataWith(card: card)
    }
}
