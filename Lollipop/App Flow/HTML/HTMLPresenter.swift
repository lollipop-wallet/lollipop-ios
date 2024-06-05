//
//  HTMLPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HTMLPresenter: HTMLPresenterProtocol  {
    
    var interactor : HTMLInputInteractorProtocol?
    weak var view: HTMLViewProtocol?
    var wireframe: HTMLWireframeProtocol?
    
}

extension HTMLPresenter: HTMLOutputInteractorProtocol {
    
}
