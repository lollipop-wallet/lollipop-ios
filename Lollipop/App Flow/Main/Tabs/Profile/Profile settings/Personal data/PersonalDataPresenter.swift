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
