//
//  ReorderCardsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ReorderCardsWireframe: ReorderCardsWireframeProtocol {
    
    static var cards: [Card]?
    static var delegate: ReorderCardsControllerProtocol? 
    
    static func createModule(ReorderCardsRef: ReorderCardsView) {
        let presenter: ReorderCardsPresenterProtocol & ReorderCardsOutputInteractorProtocol = ReorderCardsPresenter()
        ReorderCardsRef.presenter = presenter
        ReorderCardsRef.presenter?.wireframe = ReorderCardsWireframe()
        ReorderCardsRef.presenter?.view = ReorderCardsRef
        ReorderCardsRef.presenter?.interactor = ReorderCardsInteractor()
        ReorderCardsRef.presenter?.interactor?.presenter = presenter
        
    }
}
