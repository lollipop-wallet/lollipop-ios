//
//  RegisterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class RegisterPresenter: NSObject, RegisterPresenterProtocol  {
    
    var interactor : RegisterInputInteractorProtocol?
    weak var view: RegisterViewProtocol?
    var wireframe: RegisterWireframeProtocol?
    
    func proceed() {
        wireframe?.toPWd()
    }
}

extension RegisterPresenter: RegisterOutputInteractorProtocol {
    
}

//MARK: InputCalendarField delegate
extension RegisterPresenter {
    func showCalendar() {
        view?.displayCalendar()
    }
}

//MARK: Dropdown field delegate
extension RegisterPresenter {
    func showDropdown() {
        
    }
}
