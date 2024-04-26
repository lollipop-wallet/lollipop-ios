//
//  PartnersPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnersPresenter: PartnersPresenterProtocol  {
    
    var interactor : PartnersInputInteractorProtocol?
    weak var view: PartnersViewProtocol?
    var wireframe: PartnersWireframeProtocol?
    
}

extension PartnersPresenter: PartnersOutputInteractorProtocol {
    
}
