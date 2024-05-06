//
//  ProgrammeRulesWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProgrammeRulesWireframe: ProgrammeRulesWireframeProtocol {
    
    
    static func createModule(ProgrammeRulesRef: ProgrammeRulesView) {
        let presenter: ProgrammeRulesPresenterProtocol & ProgrammeRulesOutputInteractorProtocol = ProgrammeRulesPresenter()
        ProgrammeRulesRef.presenter = presenter
        ProgrammeRulesRef.presenter?.wireframe = ProgrammeRulesWireframe()
        ProgrammeRulesRef.presenter?.view = ProgrammeRulesRef
        ProgrammeRulesRef.presenter?.interactor = ProgrammeRulesInteractor()
        ProgrammeRulesRef.presenter?.interactor?.presenter = presenter
        
    }
}
