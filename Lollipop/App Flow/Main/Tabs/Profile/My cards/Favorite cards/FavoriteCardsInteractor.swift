//
//  FavoriteCardsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class FavoriteCardsInteractor: FavoriteCardsInputInteractorProtocol {
    
    weak var presenter: FavoriteCardsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let cards = FavoriteCardsWireframe.cards ?? []
        let delegate = FavoriteCardsWireframe.delegate
        presenter?.takeData(cards: cards, delegate: delegate)
    }
    
    func toggleFavoriteWith(alias: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.togglecardfavorite(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseFavoriteData(result: result)
        }
    }
}
