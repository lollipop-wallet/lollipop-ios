//
//  MyCardsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyCardsWireframe: MyCardsWireframeProtocol {
    
    static var delegate: MyCardsControllerProtocol?
    
    static func createModule(MyCardsRef: MyCardsView) {
        let presenter: MyCardsPresenterProtocol & MyCardsOutputInteractorProtocol = MyCardsPresenter()
        MyCardsRef.presenter = presenter
        MyCardsRef.presenter?.wireframe = MyCardsWireframe()
        MyCardsRef.presenter?.view = MyCardsRef
        MyCardsRef.presenter?.interactor = MyCardsInteractor()
        MyCardsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDetails(card: Card?, delegate: CardDetailsControllerProtocol?){
        let vc = CardDetailsView()
        CardDetailsWireframe.card = card
        CardDetailsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toFavoriteCardsWith(cards: [Card], delegate: FavoriteCardsControllerProtocol?){
        let vc = FavoriteCardsView()
        FavoriteCardsWireframe.cards = cards
        FavoriteCardsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toReorderCardsWith(cards: [Card], delegate: ReorderCardsControllerProtocol?){
        let vc = ReorderCardsView()
        ReorderCardsWireframe.cards = cards
        ReorderCardsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toLoyaltyCardDetailsWith(card: Card?){
        let vc = WalletCardView()
        WalletCardWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toDisplayCardDetailsWith(card: Card?){
        let vc = DisplayCardView()
        DisplayCardWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
