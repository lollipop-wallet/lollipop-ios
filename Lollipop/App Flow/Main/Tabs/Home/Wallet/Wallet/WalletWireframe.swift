//
//  WalletWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletWireframe: WalletWireframeProtocol {
    
    static var cards: [Card]?
    
    static func createModule(WalletRef: WalletView) {
        let presenter: WalletPresenterProtocol & WalletOutputInteractorProtocol = WalletPresenter()
        WalletRef.presenter = presenter
        WalletRef.presenter?.wireframe = WalletWireframe()
        WalletRef.presenter?.view = WalletRef
        WalletRef.presenter?.interactor = WalletInteractor()
        WalletRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toWalletCard(){
        let vc = WalletCardView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMyCards(){
        let vc = MyCardsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toCardSuggestions(){
        let vc = ScanSuggestionView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
