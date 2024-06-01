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
        let delegate = LocationsFilterWireframe.delegate
        let cities = LocationsFilterWireframe.cities ?? []
        let brands = LocationsFilterWireframe.brands ?? []
        let partnerId = LocationsFilterWireframe.partnerId ?? 0
        presenter?.takeDataWith(filterType: filterType, delegate: delegate, cities: cities, brands: brands, partnerId: partnerId)
    }
    
    func getLocations(partnerId: Int, brands: String, cities: String){
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getlocations(parnerId: partnerId, brands: brands, cities: cities) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseLocationsData(result: result)
        }
    }
}
