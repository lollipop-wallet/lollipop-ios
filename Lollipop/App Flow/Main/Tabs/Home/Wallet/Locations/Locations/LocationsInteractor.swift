//
//  LocationsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LocationsInteractor: LocationsInputInteractorProtocol {
    
    weak var presenter: LocationsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let partner = LocationsWireframe.partner
        presenter?.takeData(partner: partner)
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
