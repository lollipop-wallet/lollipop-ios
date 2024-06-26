//
//  LocationsFilterProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol LocationsFilterPresenterProtocol: UITableViewDelegate, UITableViewDataSource,  LocationsFilterCellProtocol{
    
    var interactor: LocationsFilterInputInteractorProtocol? { get set }
    var view: LocationsFilterViewProtocol? { get set }
    var wireframe:LocationsFilterWireframeProtocol? { get set }
    
    func viewDidLoad()
    func reset()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LocationsFilterInputInteractorProtocol: AnyObject {
    
    var presenter: LocationsFilterOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func getLocations(partnerId: Int, brands: String, cities: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LocationsFilterOutputInteractorProtocol: AnyObject {
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand], partnerId: Int)
    func parseLocationsData(result: Result<LocationsModel, AFError>)
}
//MARK: View
protocol LocationsFilterViewProtocol: AnyObject {
    
    var presenter: LocationsFilterPresenterProtocol?  { get set }
    func setTitleLabelWith(title: String)
    func reload()
}
//MARK: Wireframe
protocol LocationsFilterWireframeProtocol: AnyObject {
    static var filterType: LocationFilterType? { get set }
    static var delegate: LocationsFilterControllerProtocol? { get set }
    static var cities: [City]? { get set }
    static var brands: [Brand]? { get set }
    static var partnerId: Int? { get set }
}

//MARK: LocationsFilterCell protocol
protocol LocationsFilterCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: LocationsFilterController Protocol
protocol LocationsFilterControllerProtocol: AnyObject {
    func filterWith(locations: [Location], cities: [City], brands: [Brand])
}
