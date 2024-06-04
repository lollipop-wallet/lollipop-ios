//
//  PartnerDetailsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerDetailsWireframe: PartnerDetailsWireframeProtocol {
    
    static var alias: String?
    
    static func createModule(PartnerDetailsRef: PartnerDetailsView) {
        let presenter: PartnerDetailsPresenterProtocol & PartnerDetailsOutputInteractorProtocol = PartnerDetailsPresenter()
        PartnerDetailsRef.presenter = presenter
        PartnerDetailsRef.presenter?.wireframe = PartnerDetailsWireframe()
        PartnerDetailsRef.presenter?.view = PartnerDetailsRef
        PartnerDetailsRef.presenter?.interactor = PartnerDetailsInteractor()
        PartnerDetailsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPartnerCardWith(card: CardTemplate?){
        let vc = PartnerCardView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
