//
//  PartnerCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardPresenter: PartnerCardPresenterProtocol  {
    
    var interactor : PartnerCardInputInteractorProtocol?
    weak var view: PartnerCardViewProtocol?
    var wireframe: PartnerCardWireframeProtocol?
    
}

extension PartnerCardPresenter: PartnerCardOutputInteractorProtocol {
    
}
