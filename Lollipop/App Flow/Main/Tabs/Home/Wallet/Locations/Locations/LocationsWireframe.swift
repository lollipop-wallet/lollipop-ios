//
//  LocationsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsWireframe: LocationsWireframeProtocol {
    
    
    static func createModule(LocationsRef: LocationsView) {
        let presenter: LocationsPresenterProtocol & LocationsOutputInteractorProtocol = LocationsPresenter()
        LocationsRef.presenter = presenter
        LocationsRef.presenter?.wireframe = LocationsWireframe()
        LocationsRef.presenter?.view = LocationsRef
        LocationsRef.presenter?.interactor = LocationsInteractor()
        LocationsRef.presenter?.interactor?.presenter = presenter
        
    }
}
