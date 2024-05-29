//
//  FavoriteCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class FavoriteCardsPresenter: FavoriteCardsPresenterProtocol  {
    
    var interactor : FavoriteCardsInputInteractorProtocol?
    weak var view: FavoriteCardsViewProtocol?
    var wireframe: FavoriteCardsWireframeProtocol?
    
}

extension FavoriteCardsPresenter: FavoriteCardsOutputInteractorProtocol {
    
}
