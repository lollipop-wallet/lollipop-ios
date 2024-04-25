//
//  PasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PasswordPresenter: PasswordPresenterProtocol  {
    
    var interactor : PasswordInputInteractorProtocol?
    weak var view: PasswordViewProtocol?
    var wireframe: PasswordWireframeProtocol?
    
    func proceed() {
        wireframe?.toOtp()
    }
}

extension PasswordPresenter: PasswordOutputInteractorProtocol {
    
}
