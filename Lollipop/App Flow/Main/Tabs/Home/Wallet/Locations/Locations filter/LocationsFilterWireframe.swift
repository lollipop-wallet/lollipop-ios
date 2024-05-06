//
//  LocationsFilterWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsFilterWireframe: LocationsFilterWireframeProtocol {
    
    static var filterType: LocationFilterType?
    
    static func createModule(LocationsFilterRef: LocationsFilterView) {
        let presenter: LocationsFilterPresenterProtocol & LocationsFilterOutputInteractorProtocol = LocationsFilterPresenter()
        LocationsFilterRef.presenter = presenter
        LocationsFilterRef.presenter?.wireframe = LocationsFilterWireframe()
        LocationsFilterRef.presenter?.view = LocationsFilterRef
        LocationsFilterRef.presenter?.interactor = LocationsFilterInteractor()
        LocationsFilterRef.presenter?.interactor?.presenter = presenter
        
    }
}
