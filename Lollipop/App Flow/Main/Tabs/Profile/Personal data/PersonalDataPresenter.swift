//
//  PersonalDataPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PersonalDataPresenter: PersonalDataPresenterProtocol  {
    
    var interactor : PersonalDataInputInteractorProtocol?
    weak var view: PersonalDataViewProtocol?
    var wireframe: PersonalDataWireframeProtocol?
    
}

extension PersonalDataPresenter: PersonalDataOutputInteractorProtocol {
    
}
