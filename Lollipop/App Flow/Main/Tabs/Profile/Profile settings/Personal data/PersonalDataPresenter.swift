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
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func proceed() {
        
    }
}

extension PersonalDataPresenter: PersonalDataOutputInteractorProtocol {
    func takeData(model: ProfileModel?){
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
