//
//  HomePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HomePresenter: HomePresenterProtocol  {
    
    var interactor : HomeInputInteractorProtocol?
    weak var view: HomeViewProtocol?
    var wireframe: HomeWireframeProtocol?
    
}

extension HomePresenter: HomeOutputInteractorProtocol {
    
}
