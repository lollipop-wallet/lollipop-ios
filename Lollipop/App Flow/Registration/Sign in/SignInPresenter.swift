//
//  SignInPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 23.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class SignInPresenter: SignInPresenterProtocol  {
    
    var interactor : SignInInputInteractorProtocol?
    weak var view: SignInViewProtocol?
    var wireframe: SignInWireframeProtocol?
    
}

extension SignInPresenter: SignInOutputInteractorProtocol {
    
}
