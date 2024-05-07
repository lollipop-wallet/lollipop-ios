//
//  NewLoyaltyCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewLoyaltyCardPresenter: NewLoyaltyCardPresenterProtocol  {
    
    var interactor : NewLoyaltyCardInputInteractorProtocol?
    weak var view: NewLoyaltyCardViewProtocol?
    var wireframe: NewLoyaltyCardWireframeProtocol?
    
}

extension NewLoyaltyCardPresenter: NewLoyaltyCardOutputInteractorProtocol {
    
}
