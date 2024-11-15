//
//  LocationsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import FittedSheets
import MapKit

class LocationsWireframe: LocationsWireframeProtocol {
    
    static var partner: Partner?
    static var brands: [Brand]?
    
    static func createModule(LocationsRef: LocationsView) {
        let presenter: LocationsPresenterProtocol & LocationsOutputInteractorProtocol = LocationsPresenter()
        LocationsRef.presenter = presenter
        LocationsRef.presenter?.wireframe = LocationsWireframe()
        LocationsRef.presenter?.view = LocationsRef
        LocationsRef.presenter?.interactor = LocationsInteractor()
        LocationsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toFilterWith(filterType: LocationFilterType, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand], partnerId: Int){
        let vc = LocationsFilterView()
        LocationsFilterWireframe.filterType = filterType
        LocationsFilterWireframe.delegate = delegate
        LocationsFilterWireframe.cities = cities
        LocationsFilterWireframe.brands = brands
        LocationsFilterWireframe.partnerId = partnerId
        let heightCount = 48 * (filterType == .city ? cities.count : brands.count)
        let sheetController = SheetViewController(controller: vc, sizes: [.fixed(CGFloat(heightCount) + 92.0)], options: Configuration().options)
        sheetController.allowPullingPastMaxHeight = false
        UIApplication.topViewController()?.present(sheetController, animated: true, completion: nil)
    }
    
    func toMapWith(location: Location?){
        let coordinate = CLLocationCoordinate2DMake(Double(location?.lat ?? "") ?? 0.0, Double(location?.lng ?? "") ?? 0.0)
        let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
        mapItem.name = location?.name ?? ""
        mapItem.openInMaps(launchOptions: [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving])
    }
}
