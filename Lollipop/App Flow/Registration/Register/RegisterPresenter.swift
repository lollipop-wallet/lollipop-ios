//
//  RegisterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class RegisterPresenter: RegisterPresenterProtocol  {
    
    var interactor : RegisterInputInteractorProtocol?
    weak var view: RegisterViewProtocol?
    var wireframe: RegisterWireframeProtocol?
    
}

extension RegisterPresenter: RegisterOutputInteractorProtocol {
    
}
