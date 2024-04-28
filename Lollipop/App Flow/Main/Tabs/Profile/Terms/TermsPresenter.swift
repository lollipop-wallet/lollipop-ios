//
//  TermsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class TermsPresenter: TermsPresenterProtocol  {
    
    var interactor : TermsInputInteractorProtocol?
    weak var view: TermsViewProtocol?
    var wireframe: TermsWireframeProtocol?
    
}

extension TermsPresenter: TermsOutputInteractorProtocol {
    
}
