//
//  FavoriteShopsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class FavoriteShopsPresenter: FavoriteShopsPresenterProtocol  {
    
    var interactor : FavoriteShopsInputInteractorProtocol?
    weak var view: FavoriteShopsViewProtocol?
    var wireframe: FavoriteShopsWireframeProtocol?
    
}

extension FavoriteShopsPresenter: FavoriteShopsOutputInteractorProtocol {
    
}
