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
}
