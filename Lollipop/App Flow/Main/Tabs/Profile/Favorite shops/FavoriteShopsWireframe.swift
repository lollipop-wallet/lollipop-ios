//
//  FavoriteShopsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class FavoriteShopsWireframe: FavoriteShopsWireframeProtocol {
    
    
    static func createModule(FavoriteShopsRef: FavoriteShopsView) {
        let presenter: FavoriteShopsPresenterProtocol & FavoriteShopsOutputInteractorProtocol = FavoriteShopsPresenter()
        FavoriteShopsRef.presenter = presenter
        FavoriteShopsRef.presenter?.wireframe = FavoriteShopsWireframe()
        FavoriteShopsRef.presenter?.view = FavoriteShopsRef
        FavoriteShopsRef.presenter?.interactor = FavoriteShopsInteractor()
        FavoriteShopsRef.presenter?.interactor?.presenter = presenter
        
    }
}
