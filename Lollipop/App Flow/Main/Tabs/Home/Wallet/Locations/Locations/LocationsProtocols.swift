//
//  LocationsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol LocationsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, LocationCellProtocol, LocationsFilterControllerProtocol {
    
    var interactor: LocationsInputInteractorProtocol? { get set }
    var view: LocationsViewProtocol? { get set }
    var wireframe:LocationsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func cityFilter()
    func shopFilter()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LocationsInputInteractorProtocol: AnyObject {
    
    var presenter: LocationsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func getLocations(partnerId: Int, brands: String, cities: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LocationsOutputInteractorProtocol: AnyObject {
    func takeData(partner: Partner?, brands: [Brand]?)
    func parseLocationsData(result: Result<LocationsModel, AFError>)
}
//MARK: View
protocol LocationsViewProtocol: AnyObject {
    
    var presenter: LocationsPresenterProtocol?  { get set }
    func reload()
    func setCityLabelWith(text: String)
    func setBrandLabelWith(text: String)
}
//MARK: Wireframe
protocol LocationsWireframeProtocol: AnyObject {
    static var partner: Partner? { get set }
    static var brands: [Brand]? { get set }
    func toFilterWith(filterType: LocationFilterType, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand], partnerId: Int)
    func toMapWith(location: Location?)
}

//MARK: LocationCell Protocol
protocol LocationCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
