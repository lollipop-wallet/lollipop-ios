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
    
    var tag = Int()
    
    func proceed() {
        wireframe?.toPWd()
    }
    
    func handleGenderDropdownTapWith(item: Gender){
        view?.setGenderWith(item: item.label ?? "")
    }
    
    func handleCityDropdownTapWith(item: String){
        view?.setCityWith(item: item)
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
    func showHideDropdown(tag: Int) {
        self.tag = tag
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dropdown delegate
extension RegisterPresenter {
    func dropDownHidden(tag: Int) {
        view?.hideDropdownWith(tag: tag)
    }
    
    func dropDownShown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}
