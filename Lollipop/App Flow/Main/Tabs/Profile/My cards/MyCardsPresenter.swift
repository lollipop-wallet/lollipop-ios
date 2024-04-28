//
//  MyCardsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyCardsPresenter: MyCardsPresenterProtocol  {
    
    var interactor : MyCardsInputInteractorProtocol?
    weak var view: MyCardsViewProtocol?
    var wireframe: MyCardsWireframeProtocol?
    
}

extension MyCardsPresenter: MyCardsOutputInteractorProtocol {
    
}
