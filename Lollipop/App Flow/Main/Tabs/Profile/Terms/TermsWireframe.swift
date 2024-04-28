//
//  TermsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class TermsWireframe: TermsWireframeProtocol {
    
    
    static func createModule(TermsRef: TermsView) {
        let presenter: TermsPresenterProtocol & TermsOutputInteractorProtocol = TermsPresenter()
        TermsRef.presenter = presenter
        TermsRef.presenter?.wireframe = TermsWireframe()
        TermsRef.presenter?.view = TermsRef
        TermsRef.presenter?.interactor = TermsInteractor()
        TermsRef.presenter?.interactor?.presenter = presenter
        
    }
}
