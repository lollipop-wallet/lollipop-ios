//
//  AboutWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AboutWireframe: AboutWireframeProtocol {
    
    
    static func createModule(AboutRef: AboutView) {
        let presenter: AboutPresenterProtocol & AboutOutputInteractorProtocol = AboutPresenter()
        AboutRef.presenter = presenter
        AboutRef.presenter?.wireframe = AboutWireframe()
        AboutRef.presenter?.view = AboutRef
        AboutRef.presenter?.interactor = AboutInteractor()
        AboutRef.presenter?.interactor?.presenter = presenter
        
    }
}
