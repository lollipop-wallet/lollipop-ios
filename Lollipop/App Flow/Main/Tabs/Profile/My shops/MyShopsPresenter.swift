//
//  MyShopsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyShopsPresenter: MyShopsPresenterProtocol  {
    
    var interactor : MyShopsInputInteractorProtocol?
    weak var view: MyShopsViewProtocol?
    var wireframe: MyShopsWireframeProtocol?
    
}

extension MyShopsPresenter: MyShopsOutputInteractorProtocol {
    
}
