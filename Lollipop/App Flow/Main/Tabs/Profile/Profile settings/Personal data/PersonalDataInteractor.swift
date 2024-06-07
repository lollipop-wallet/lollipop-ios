//
//  PersonalDataInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PersonalDataInteractor: PersonalDataInputInteractorProtocol {
    
    weak var presenter: PersonalDataOutputInteractorProtocol?
    
    func viewDidLoad() {
        let model = PersonalDataWireframe.model
        let delegate = PersonalDataWireframe.delegate
        presenter?.takeData(model: model, delegate: delegate)
    }
    
    func update(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String){
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.updateuser(name: "\(firstname) \(lastname)", email: email, phone: "", dob: dob, city: city, gender: gender) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else { return }
            self.presenter?.par
        }
    }
}
