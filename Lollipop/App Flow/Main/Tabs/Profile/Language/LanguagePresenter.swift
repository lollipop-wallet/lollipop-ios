//
//  LanguagePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LanguagePresenter: LanguagePresenterProtocol  {
    
    var interactor : LanguageInputInteractorProtocol?
    weak var view: LanguageViewProtocol?
    var wireframe: LanguageWireframeProtocol?
    
}

extension LanguagePresenter: LanguageOutputInteractorProtocol {
    
}
