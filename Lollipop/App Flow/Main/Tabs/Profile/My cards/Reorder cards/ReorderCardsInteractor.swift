//
//  ReorderCardsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ReorderCardsInteractor: ReorderCardsInputInteractorProtocol {
    
    weak var presenter: ReorderCardsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let cards = ReorderCardsWireframe.cards ?? []
        let delegate = ReorderCardsWireframe.delegate
        presenter?.takeData(cards: cards, delegate: delegate)
    }
}
