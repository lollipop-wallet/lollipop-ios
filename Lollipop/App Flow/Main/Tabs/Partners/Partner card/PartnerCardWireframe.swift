//
//  PartnerCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardWireframe: PartnerCardWireframeProtocol {
    
    
    static func createModule(PartnerCardRef: PartnerCardView) {
        let presenter: PartnerCardPresenterProtocol & PartnerCardOutputInteractorProtocol = PartnerCardPresenter()
        PartnerCardRef.presenter = presenter
        PartnerCardRef.presenter?.wireframe = PartnerCardWireframe()
        PartnerCardRef.presenter?.view = PartnerCardRef
        PartnerCardRef.presenter?.interactor = PartnerCardInteractor()
        PartnerCardRef.presenter?.interactor?.presenter = presenter
        
    }
}
