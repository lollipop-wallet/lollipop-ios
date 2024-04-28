//
//  FavoriteShopsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol FavoriteShopsPresenterProtocol: AnyObject {
    
    var interactor: FavoriteShopsInputInteractorProtocol? { get set }
    var view: FavoriteShopsViewProtocol? { get set }
    var wireframe:FavoriteShopsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol FavoriteShopsInputInteractorProtocol: AnyObject {
    
    var presenter: FavoriteShopsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol FavoriteShopsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol FavoriteShopsViewProtocol: AnyObject {
    
    var presenter: FavoriteShopsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol FavoriteShopsWireframeProtocol: AnyObject {

    
}
