//
//  FavoriteCardsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class FavoriteCardsWireframe: FavoriteCardsWireframeProtocol {
    
    
    static func createModule(FavoriteCardsRef: FavoriteCardsView) {
        let presenter: FavoriteCardsPresenterProtocol & FavoriteCardsOutputInteractorProtocol = FavoriteCardsPresenter()
        FavoriteCardsRef.presenter = presenter
        FavoriteCardsRef.presenter?.wireframe = FavoriteCardsWireframe()
        FavoriteCardsRef.presenter?.view = FavoriteCardsRef
        FavoriteCardsRef.presenter?.interactor = FavoriteCardsInteractor()
        FavoriteCardsRef.presenter?.interactor?.presenter = presenter
        
    }
}
