//
//  LocationsFilterInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LocationsFilterInteractor: LocationsFilterInputInteractorProtocol {
    
    weak var presenter: LocationsFilterOutputInteractorProtocol?
    
    func viewDidLoad() {
        let filterType = LocationsFilterWireframe.filterType
        presenter?.takeDataWith(filterType: filterType)
    }
}
