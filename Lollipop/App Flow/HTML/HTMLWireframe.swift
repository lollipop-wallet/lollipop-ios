//
//  HTMLWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HTMLWireframe: HTMLWireframeProtocol {
    
    
    static func createModule(HTMLRef: HTMLView) {
        let presenter: HTMLPresenterProtocol & HTMLOutputInteractorProtocol = HTMLPresenter()
        HTMLRef.presenter = presenter
        HTMLRef.presenter?.wireframe = HTMLWireframe()
        HTMLRef.presenter?.view = HTMLRef
        HTMLRef.presenter?.interactor = HTMLInteractor()
        HTMLRef.presenter?.interactor?.presenter = presenter
        
    }
}
