//
//  ScanSuggestionPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ScanSuggestionPresenter: ScanSuggestionPresenterProtocol  {
    
    var interactor : ScanSuggestionInputInteractorProtocol?
    weak var view: ScanSuggestionViewProtocol?
    var wireframe: ScanSuggestionWireframeProtocol?
    
}

extension ScanSuggestionPresenter: ScanSuggestionOutputInteractorProtocol {
    
}
