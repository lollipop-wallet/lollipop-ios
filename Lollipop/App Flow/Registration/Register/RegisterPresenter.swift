//
//  RegisterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class RegisterPresenter: NSObject, RegisterPresenterProtocol  {
    
    var interactor : RegisterInputInteractorProtocol?
    weak var view: RegisterViewProtocol?
    var wireframe: RegisterWireframeProtocol?
    
    var tag = Int()
    
    func proceed(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String){
        guard !firstname.isEmpty, !lastname.isEmpty, !dob.isEmpty, !email.isEmpty, !gender.isEmpty else {
            view?.validate(isFirstNameEmpty: firstname.isEmpty, isLastNameEmpty: lastname.isEmpty, isEmailEmpty: email.isEmpty, isGenderEmpty: gender == LocalizedTitle.choose.localized, isDoBEmpty: dob == LocalizedTitle.choose.localized)
            return
        }
        wireframe?.toPWdWith(firstname: firstname, lastname: lastname, email: email, dob: dob, gender: gender, city: city)
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
