//
//  DisplayCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DisplayCardPresenter: DisplayCardPresenterProtocol  {
    
    var interactor : DisplayCardInputInteractorProtocol?
    weak var view: DisplayCardViewProtocol?
    var wireframe: DisplayCardWireframeProtocol?
    
}

extension DisplayCardPresenter: DisplayCardOutputInteractorProtocol {
    
}
