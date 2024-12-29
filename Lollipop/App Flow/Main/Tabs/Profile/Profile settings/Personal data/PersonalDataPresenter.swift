//
//  PersonalDataPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class PersonalDataPresenter: NSObject, PersonalDataPresenterProtocol  {

    
    var interactor : PersonalDataInputInteractorProtocol?
    weak var view: PersonalDataViewProtocol?
    var wireframe: PersonalDataWireframeProtocol?
    
    var model: ProfileModel?
    var gender: Gender?
    var delegate: PersonalDataControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func handleGenderDropdownTapWith(item: Gender){
        self.gender = item
        view?.setGender(gender: item.label ?? "")
    }
    
    func handleCityDropdownTapWith(item: String){
        view?.setCity(city: item)
    }
    
    func proceed(firstname: String, lastname: String, email: String, phone: String, dob: String, gender: String, city: String){
        guard !firstname.isEmpty, !lastname.isEmpty, !dob.isEmpty, !email.isEmpty, !gender.isEmpty else {
            view?.validate(isFirstNameEmpty: firstname.isEmpty, isLastNameEmpty: lastname.isEmpty, isEmailEmpty: email.isEmpty, isGenderEmpty: gender == LocalizedTitle.choose.localized || gender.isEmpty, isDoBEmpty: dob == LocalizedTitle.choose.localized || dob.isEmpty)
            return
        }
        interactor?.update(firstname: firstname, lastname: lastname, email: email, phone: phone, dob: dob, gender: self.gender?.code ?? "", city: city)
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
        self.view?.setPhoneWith(phone: model?.phone ?? "")
        self.gender = Gender(code: model?.gender ?? "", label: model?.genderUserReadable)
    }
    
    func parseUpdateUserData(result: Result<PersonalDataModel, AFError>){
        switch result {
        case .success(let model):
            self.model = model.data
            self.delegate?.didUpdateProfileWith(model: model.data)
            Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: model.message ?? "", shouldDismiss: false)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
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
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dropdown delegate
extension PersonalDataPresenter {
    func dropDownHidden(tag: Int) {
        view?.hideDropdownWith(tag: tag)
    }
    
    func dropDownShown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}
