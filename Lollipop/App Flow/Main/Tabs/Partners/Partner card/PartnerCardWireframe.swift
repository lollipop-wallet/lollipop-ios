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
    
    static func createModule(PartnerCardRef: PartnerCardView) {
        let presenter: PartnerCardPresenterProtocol & PartnerCardOutputInteractorProtocol = PartnerCardPresenter()
        PartnerCardRef.presenter = presenter
        PartnerCardRef.presenter?.wireframe = PartnerCardWireframe()
        PartnerCardRef.presenter?.view = PartnerCardRef
        PartnerCardRef.presenter?.interactor = PartnerCardInteractor()
        PartnerCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPartnerNewCard(){
        let vc = PartnerCardSignupView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toScannerWith(card: Card?){
        let vc = ScannerView()
        ScannerWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
