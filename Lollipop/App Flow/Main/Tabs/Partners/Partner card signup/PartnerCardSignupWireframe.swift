//
//  PartnerCardSignupWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardSignupWireframe: PartnerCardSignupWireframeProtocol {
    
    
    static func createModule(PartnerCardSignupRef: PartnerCardSignupView) {
        let presenter: PartnerCardSignupPresenterProtocol & PartnerCardSignupOutputInteractorProtocol = PartnerCardSignupPresenter()
        PartnerCardSignupRef.presenter = presenter
        PartnerCardSignupRef.presenter?.wireframe = PartnerCardSignupWireframe()
        PartnerCardSignupRef.presenter?.view = PartnerCardSignupRef
        PartnerCardSignupRef.presenter?.interactor = PartnerCardSignupInteractor()
        PartnerCardSignupRef.presenter?.interactor?.presenter = presenter
        
    }
}
