//
//  MainPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MainPresenter: MainPresenterProtocol  {
    
    var interactor : MainInputInteractorProtocol?
    weak var view: MainViewProtocol?
    var wireframe: MainWireframeProtocol?
    
}

extension MainPresenter: MainOutputInteractorProtocol {
    
}
