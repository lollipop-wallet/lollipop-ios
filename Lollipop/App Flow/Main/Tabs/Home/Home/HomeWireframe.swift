//
//  HomeWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HomeWireframe: HomeWireframeProtocol {
    
    static var delegate: HomeControllerProtocol?
    
    static func createModule(HomeRef: HomeView) {
        let presenter: HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        HomeRef.presenter = presenter
        HomeRef.presenter?.wireframe = HomeWireframe()
        HomeRef.presenter?.view = HomeRef
        HomeRef.presenter?.interactor = HomeInteractor()
        HomeRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPromotions(){
        let vc = PromotionsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toPromotionDetailsWith(banner: Banner?){
        let vc = PromotionDetailsView()
        PromotionDetailsWireframe.banner = banner
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toCardTemplates(){
        let vc = ScanSuggestionView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toLoyaltyCardDetailsWith(card: Card?){
        let vc = WalletCardView()
        WalletCardWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
