//
//  PromotionsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionsWireframe: PromotionsWireframeProtocol {
    
    
    static func createModule(PromotionsRef: PromotionsView) {
        let presenter: PromotionsPresenterProtocol & PromotionsOutputInteractorProtocol = PromotionsPresenter()
        PromotionsRef.presenter = presenter
        PromotionsRef.presenter?.wireframe = PromotionsWireframe()
        PromotionsRef.presenter?.view = PromotionsRef
        PromotionsRef.presenter?.interactor = PromotionsInteractor()
        PromotionsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDetailsWith(banner: Banner?){
        let vc = PromotionDetailsView()
        PromotionDetailsWireframe.banner = banner
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
