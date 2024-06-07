//
//  PersonalDataWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PersonalDataWireframe: PersonalDataWireframeProtocol {
    
    static var model: ProfileModel?
    static var delegate: PersonalDataControllerProtocol?
    
    static func createModule(PersonalDataRef: PersonalDataView) {
        let presenter: PersonalDataPresenterProtocol & PersonalDataOutputInteractorProtocol = PersonalDataPresenter()
        PersonalDataRef.presenter = presenter
        PersonalDataRef.presenter?.wireframe = PersonalDataWireframe()
        PersonalDataRef.presenter?.view = PersonalDataRef
        PersonalDataRef.presenter?.interactor = PersonalDataInteractor()
        PersonalDataRef.presenter?.interactor?.presenter = presenter
        
    }
}
