//
//  AccountDeletionPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AccountDeletionPresenter: AccountDeletionPresenterProtocol  {
    
    var interactor : AccountDeletionInputInteractorProtocol?
    weak var view: AccountDeletionViewProtocol?
    var wireframe: AccountDeletionWireframeProtocol?
    
}

extension AccountDeletionPresenter: AccountDeletionOutputInteractorProtocol {
    
}
