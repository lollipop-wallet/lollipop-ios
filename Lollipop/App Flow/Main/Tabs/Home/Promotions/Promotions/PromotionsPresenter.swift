//
//  PromotionsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionsPresenter: PromotionsPresenterProtocol  {
    
    var interactor : PromotionsInputInteractorProtocol?
    weak var view: PromotionsViewProtocol?
    var wireframe: PromotionsWireframeProtocol?
    
}

extension PromotionsPresenter: PromotionsOutputInteractorProtocol {
    
}
