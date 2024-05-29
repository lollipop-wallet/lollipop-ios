//
//  MyCardsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyCardsWireframe: MyCardsWireframeProtocol {
    
    
    static func createModule(MyCardsRef: MyCardsView) {
        let presenter: MyCardsPresenterProtocol & MyCardsOutputInteractorProtocol = MyCardsPresenter()
        MyCardsRef.presenter = presenter
        MyCardsRef.presenter?.wireframe = MyCardsWireframe()
        MyCardsRef.presenter?.view = MyCardsRef
        MyCardsRef.presenter?.interactor = MyCardsInteractor()
        MyCardsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDetails() {
        let vc = CardDetailsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toFavoriteCardsWith(cards: [Card], delegate: FavoriteCardsControllerProtocol?){
        let vc = FavoriteCardsView()
        FavoriteCardsWireframe.cards = cards
        FavoriteCardsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toReorderCardsWith(cards: [Card], delegate: ReorderCardsControllerProtocol?){
        
    }
}
