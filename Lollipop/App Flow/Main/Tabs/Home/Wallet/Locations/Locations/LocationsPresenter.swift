//
//  LocationsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsPresenter: LocationsPresenterProtocol  {
    
    var interactor : LocationsInputInteractorProtocol?
    weak var view: LocationsViewProtocol?
    var wireframe: LocationsWireframeProtocol?
    
}

extension LocationsPresenter: LocationsOutputInteractorProtocol {
    
}
