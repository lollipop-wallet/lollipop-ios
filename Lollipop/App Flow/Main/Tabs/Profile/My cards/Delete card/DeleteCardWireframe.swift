//
//  DeleteCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DeleteCardWireframe: DeleteCardWireframeProtocol {
    
    
    static func createModule(DeleteCardRef: DeleteCardView) {
        let presenter: DeleteCardPresenterProtocol & DeleteCardOutputInteractorProtocol = DeleteCardPresenter()
        DeleteCardRef.presenter = presenter
        DeleteCardRef.presenter?.wireframe = DeleteCardWireframe()
        DeleteCardRef.presenter?.view = DeleteCardRef
        DeleteCardRef.presenter?.interactor = DeleteCardInteractor()
        DeleteCardRef.presenter?.interactor?.presenter = presenter
        
    }
}
