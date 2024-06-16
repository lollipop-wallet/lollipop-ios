//
//  PromotionsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionsWireframe: PromotionsWireframeProtocol {
    
    static var partnerAlias: String? 
    
    static func createModule(PromotionsRef: PromotionsView) {
        let presenter: PromotionsPresenterProtocol & PromotionsOutputInteractorProtocol = PromotionsPresenter()
        PromotionsRef.presenter = presenter
        PromotionsRef.presenter?.wireframe = PromotionsWireframe()
        PromotionsRef.presenter?.view = PromotionsRef
        PromotionsRef.presenter?.interactor = PromotionsInteractor()
        PromotionsRef.presenter?.interactor?.presenter = presenter
        
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
