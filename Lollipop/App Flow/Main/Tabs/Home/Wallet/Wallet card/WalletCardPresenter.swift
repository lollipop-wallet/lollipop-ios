//
//  WalletCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletCardPresenter:WalletCardPresenterProtocol  {
    
    var interactor : WalletCardInputInteractorProtocol?
    weak var view: WalletCardViewProtocol?
    var wireframe: WalletCardWireframeProtocol?
    
}

extension WalletCardPresenter: WalletCardOutputInteractorProtocol {
    
}

