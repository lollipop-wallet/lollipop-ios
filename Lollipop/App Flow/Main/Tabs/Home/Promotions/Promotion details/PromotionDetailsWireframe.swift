//
//  PromotionDetailsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionDetailsWireframe: PromotionDetailsWireframeProtocol {
    
    
    static func createModule(PromotionDetailsRef: PromotionDetailsView) {
        let presenter: PromotionDetailsPresenterProtocol & PromotionDetailsOutputInteractorProtocol = PromotionDetailsPresenter()
        PromotionDetailsRef.presenter = presenter
        PromotionDetailsRef.presenter?.wireframe = PromotionDetailsWireframe()
        PromotionDetailsRef.presenter?.view = PromotionDetailsRef
        PromotionDetailsRef.presenter?.interactor = PromotionDetailsInteractor()
        PromotionDetailsRef.presenter?.interactor?.presenter = presenter
        
    }
}
