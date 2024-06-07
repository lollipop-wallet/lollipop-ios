//
//  PersonalDataPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PersonalDataPresenter: NSObject, PersonalDataPresenterProtocol  {

    
    var interactor : PersonalDataInputInteractorProtocol?
    weak var view: PersonalDataViewProtocol?
    var wireframe: PersonalDataWireframeProtocol?
    
    var model: ProfileModel?
    var delegate: PersonalDataControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String){
        guard !firstname.isEmpty, !lastname.isEmpty, !dob.isEmpty, !email.isEmpty, !gender.isEmpty else {
            view?.validate(isFirstNameEmpty: firstname.isEmpty, isLastNameEmpty: lastname.isEmpty, isEmailEmpty: email.isEmpty, isGenderEmpty: gender == LocalizedTitle.choose.localized, isDoBEmpty: dob == LocalizedTitle.choose.localized)
            return
        }
    }
}

extension PersonalDataPresenter: PersonalDataOutputInteractorProtocol {
    func takeData(model: ProfileModel?, delegate: PersonalDataControllerProtocol?){
        self.delegate = delegate
        self.model = model
        let nameComponents = model?.name?.components(separatedBy: " ") ?? []
        if !nameComponents.isEmpty {
            self.view?.setFirstName(firstName: nameComponents[0])
        }
        if nameComponents.count == 2 {
            self.view?.setLastName(lastName: nameComponents[1])
        }else if nameComponents.count > 2 {
            self.view?.setLastName(lastName: "\(nameComponents[1]) \(nameComponents[2])")
        }
        self.view?.setEmail(email: model?.email ?? "")
        self.view?.setDoB(dob: model?.date_of_birth?.dateString ?? "")
        self.view?.setGender(gender: model?.genderUserReadable ?? "")
        self.view?.setCity(city: model?.city ?? "")
    }
}

//MARK: InputCalendarField delegate
extension PersonalDataPresenter {
    func showCalendar() {
        view?.displayCalendar()
    }
}

//MARK: Dropdown field delegate
extension PersonalDataPresenter {
    func showHideDropdown(tag: Int) {
        
    }
}
