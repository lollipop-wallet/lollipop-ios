//
//  WalletPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletPresenter: WalletPresenterProtocol  {
    
    var interactor : WalletInputInteractorProtocol?
    weak var view: WalletViewProtocol?
    var wireframe: WalletWireframeProtocol?
    
}

extension WalletPresenter: WalletOutputInteractorProtocol {
    
}
