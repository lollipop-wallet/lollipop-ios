//
//  LocationsFilterProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol LocationsFilterPresenterProtocol: UITableViewDelegate, UITableViewDataSource,  LocationsFilterCellProtocol{
    
    var interactor: LocationsFilterInputInteractorProtocol? { get set }
    var view: LocationsFilterViewProtocol? { get set }
    var wireframe:LocationsFilterWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LocationsFilterInputInteractorProtocol: AnyObject {
    
    var presenter: LocationsFilterOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LocationsFilterOutputInteractorProtocol: AnyObject {
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand])
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
}

//MARK: LocationsFilterCell protocol
protocol LocationsFilterCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: LocationsFilterController Protocol
protocol LocationsFilterControllerProtocol: AnyObject {
    func filterLocationsByCities()
    func filterLocationsByShops()
}
