//
//  ProgrammeRulesPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProgrammeRulesPresenter: ProgrammeRulesPresenterProtocol  {
    
    var interactor : ProgrammeRulesInputInteractorProtocol?
    weak var view: ProgrammeRulesViewProtocol?
    var wireframe: ProgrammeRulesWireframeProtocol?
    
}

extension ProgrammeRulesPresenter: ProgrammeRulesOutputInteractorProtocol {
    
}
