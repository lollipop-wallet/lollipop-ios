//
//  ChangePasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ChangePasswordPresenter: ChangePasswordPresenterProtocol  {
    
    var interactor : ChangePasswordInputInteractorProtocol?
    weak var view: ChangePasswordViewProtocol?
    var wireframe: ChangePasswordWireframeProtocol?
    
}

extension ChangePasswordPresenter: ChangePasswordOutputInteractorProtocol {
    
}
