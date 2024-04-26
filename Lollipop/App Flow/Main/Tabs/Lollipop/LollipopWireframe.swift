//
//  LollipopWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LollipopWireframe: LollipopWireframeProtocol {
    
    
    static func createModule(LollipopRef: LollipopView) {
        let presenter: LollipopPresenterProtocol & LollipopOutputInteractorProtocol = LollipopPresenter()
        LollipopRef.presenter = presenter
        LollipopRef.presenter?.wireframe = LollipopWireframe()
        LollipopRef.presenter?.view = LollipopRef
        LollipopRef.presenter?.interactor = LollipopInteractor()
        LollipopRef.presenter?.interactor?.presenter = presenter
        
    }
}
