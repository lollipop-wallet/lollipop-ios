//
//  EditCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class EditCardPresenter: EditCardPresenterProtocol  {
    
    var interactor : EditCardInputInteractorProtocol?
    weak var view: EditCardViewProtocol?
    var wireframe: EditCardWireframeProtocol?
    
}

extension EditCardPresenter: EditCardOutputInteractorProtocol {
    
}
