//
//  NewPartnerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPartnerPresenter: NewPartnerPresenterProtocol  {
    
    var interactor : NewPartnerInputInteractorProtocol?
    weak var view: NewPartnerViewProtocol?
    var wireframe: NewPartnerWireframeProtocol?
    
}

extension NewPartnerPresenter: NewPartnerOutputInteractorProtocol {
    
}
