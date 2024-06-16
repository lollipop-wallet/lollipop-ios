//
//  HomeWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SafariServices

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
        PromotionsWireframe.partnerAlias = ""
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
    
    func toDisplayCardDetailsWith(card: Card?){
        let vc = DisplayCardView()
        DisplayCardWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toBrandDetailsWith(alias: String?){
        let vc = PartnerDetailsView()
        PartnerDetailsWireframe.alias = alias
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openLink(link: String, delegate: SFSafariViewControllerDelegate){
        let url = URL(string: link)!
        let controller = SFSafariViewController(url: url)
        controller.delegate = delegate
        UIApplication.topViewController()?.present(controller, animated: true)
    }
    
    func toHTMLWith(title: String, description: String, buttonTitle: String, externalLink: String){
        let vc = HTMLView()
        HTMLWireframe.title = title
        HTMLWireframe.description = description
        HTMLWireframe.buttonTitle = buttonTitle
        HTMLWireframe.externalLink = externalLink
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toCards(){
        let vc = MyCardsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
