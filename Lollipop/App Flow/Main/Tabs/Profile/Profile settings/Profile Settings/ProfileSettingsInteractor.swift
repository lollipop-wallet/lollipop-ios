//
//  ProfileSettingsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ProfileSettingsInteractor: ProfileSettingsInputInteractorProtocol {
    
    weak var presenter: ProfileSettingsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let model = ProfileSettingsWireframe.model
        presenter?.takeData(model: model)
    }
}
