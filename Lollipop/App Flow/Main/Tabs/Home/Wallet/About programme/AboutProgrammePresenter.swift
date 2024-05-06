//
//  AboutProgrammePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AboutProgrammePresenter: AboutProgrammePresenterProtocol  {
    
    var interactor : AboutProgrammeInputInteractorProtocol?
    weak var view: AboutProgrammeViewProtocol?
    var wireframe: AboutProgrammeWireframeProtocol?
    
}

extension AboutProgrammePresenter: AboutProgrammeOutputInteractorProtocol {
    
}
