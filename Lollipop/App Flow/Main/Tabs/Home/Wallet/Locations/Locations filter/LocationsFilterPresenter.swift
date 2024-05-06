//
//  LocationsFilterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsFilterPresenter: LocationsFilterPresenterProtocol  {
    
    var interactor : LocationsFilterInputInteractorProtocol?
    weak var view: LocationsFilterViewProtocol?
    var wireframe: LocationsFilterWireframeProtocol?
    
    var filterType: LocationFilterType?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension LocationsFilterPresenter: LocationsFilterOutputInteractorProtocol {
    func takeDataWith(filterType: LocationFilterType?){
        self.filterType = filterType
    }
}
