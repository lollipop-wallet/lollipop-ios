//
//  NewPasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPasswordPresenter: NewPasswordPresenterProtocol  {
    
    var interactor : NewPasswordInputInteractorProtocol?
    weak var view: NewPasswordViewProtocol?
    var wireframe: NewPasswordWireframeProtocol?
    
}

extension NewPasswordPresenter: NewPasswordOutputInteractorProtocol {
    
}
