//
//  AboutPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AboutPresenter: AboutPresenterProtocol  {
    
    var interactor : AboutInputInteractorProtocol?
    weak var view: AboutViewProtocol?
    var wireframe: AboutWireframeProtocol?
    
}

extension AboutPresenter: AboutOutputInteractorProtocol {
    
}
