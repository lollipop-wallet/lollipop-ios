//
//  ReorderCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ReorderCardsPresenter: ReorderCardsPresenterProtocol  {
    
    var interactor : ReorderCardsInputInteractorProtocol?
    weak var view: ReorderCardsViewProtocol?
    var wireframe: ReorderCardsWireframeProtocol?
    
}

extension ReorderCardsPresenter: ReorderCardsOutputInteractorProtocol {
    
}
