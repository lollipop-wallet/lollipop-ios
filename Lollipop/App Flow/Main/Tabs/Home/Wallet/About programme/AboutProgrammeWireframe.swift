//
//  AboutProgrammeWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AboutProgrammeWireframe: AboutProgrammeWireframeProtocol {
    
    
    static func createModule(AboutProgrammeRef: AboutProgrammeView) {
        let presenter: AboutProgrammePresenterProtocol & AboutProgrammeOutputInteractorProtocol = AboutProgrammePresenter()
        AboutProgrammeRef.presenter = presenter
        AboutProgrammeRef.presenter?.wireframe = AboutProgrammeWireframe()
        AboutProgrammeRef.presenter?.view = AboutProgrammeRef
        AboutProgrammeRef.presenter?.interactor = AboutProgrammeInteractor()
        AboutProgrammeRef.presenter?.interactor?.presenter = presenter
        
    }
}
