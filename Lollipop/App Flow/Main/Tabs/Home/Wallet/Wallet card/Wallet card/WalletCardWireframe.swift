//
//  WalletCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletCardWireframe: WalletCardWireframeProtocol {
    
    static var card: Card?
    
    static func createModule(WalletCardRef: WalletCardView) {
        let presenter: WalletCardPresenterProtocol & WalletCardOutputInteractorProtocol = WalletCardPresenter()
        WalletCardRef.presenter = presenter
        WalletCardRef.presenter?.wireframe = WalletCardWireframe()
        WalletCardRef.presenter?.view = WalletCardRef
        WalletCardRef.presenter?.interactor = WalletCardInteractor()
        WalletCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toLocations(partner: Partner?){
        let vc = LocationsView()
        LocationsWireframe.partner = partner
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toCardDetails(card: Card?, delegate: CardDetailsControllerProtocol?){
        let vc = CardDetailsView()
        CardDetailsWireframe.card = card
        CardDetailsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toHTMLWith(title: String, description: String, buttonTitle: String, externalLink: String){
        let vc = HTMLView()
        HTMLWireframe.title = title
        HTMLWireframe.description = description
        HTMLWireframe.buttonTitle = buttonTitle
        HTMLWireframe.externalLink = externalLink
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toBrandDetailsWith(alias: String?){
        let vc = PartnerDetailsView()
        PartnerDetailsWireframe.alias = alias
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
