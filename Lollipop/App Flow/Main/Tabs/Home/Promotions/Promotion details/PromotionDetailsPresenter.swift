//
//  PromotionDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionDetailsPresenter: PromotionDetailsPresenterProtocol  {
    
    var interactor : PromotionDetailsInputInteractorProtocol?
    weak var view: PromotionDetailsViewProtocol?
    var wireframe: PromotionDetailsWireframeProtocol?
    
}

extension PromotionDetailsPresenter: PromotionDetailsOutputInteractorProtocol {
    
}
