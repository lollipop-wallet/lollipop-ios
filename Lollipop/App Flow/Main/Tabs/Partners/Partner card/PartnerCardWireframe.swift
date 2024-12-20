//
//  PartnerCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardWireframe: PartnerCardWireframeProtocol {
    
    static var cardTemplate: CardTemplate?
    static var partner: Partner?
    static var delegate: PartnersCardControllerProtocol?
    
    static func createModule(PartnerCardRef: PartnerCardView) {
        let presenter: PartnerCardPresenterProtocol & PartnerCardOutputInteractorProtocol = PartnerCardPresenter()
        PartnerCardRef.presenter = presenter
        PartnerCardRef.presenter?.wireframe = PartnerCardWireframe()
        PartnerCardRef.presenter?.view = PartnerCardRef
        PartnerCardRef.presenter?.interactor = PartnerCardInteractor()
        PartnerCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPartnerNewCard(card: Card?){
        let vc = PartnerCardSignupView()
        PartnerCardSignupWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toScannerWith(card: Card?){
        let vc = ScannerView()
        ScannerWireframe.card = card
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
}
