//
//  EditCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class EditCardWireframe: EditCardWireframeProtocol {
    
    
    static func createModule(EditCardRef: EditCardView) {
        let presenter: EditCardPresenterProtocol & EditCardOutputInteractorProtocol = EditCardPresenter()
        EditCardRef.presenter = presenter
        EditCardRef.presenter?.wireframe = EditCardWireframe()
        EditCardRef.presenter?.view = EditCardRef
        EditCardRef.presenter?.interactor = EditCardInteractor()
        EditCardRef.presenter?.interactor?.presenter = presenter
        
    }
}
