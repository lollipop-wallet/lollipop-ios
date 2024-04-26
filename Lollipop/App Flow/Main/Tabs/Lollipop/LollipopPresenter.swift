//
//  LollipopPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LollipopPresenter: LollipopPresenterProtocol  {
    
    var interactor : LollipopInputInteractorProtocol?
    weak var view: LollipopViewProtocol?
    var wireframe: LollipopWireframeProtocol?
    
}

extension LollipopPresenter: LollipopOutputInteractorProtocol {
    
}
