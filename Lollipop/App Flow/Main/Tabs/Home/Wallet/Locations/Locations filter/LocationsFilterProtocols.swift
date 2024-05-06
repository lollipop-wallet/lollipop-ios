//
//  LocationsFilterProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol LocationsFilterPresenterProtocol: AnyObject {
    
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
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?)
}
//MARK: View
protocol LocationsFilterViewProtocol: AnyObject {
    
    var presenter: LocationsFilterPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol LocationsFilterWireframeProtocol: AnyObject {
    static var filterType: LocationFilterType? { get set }
    static var delegate: LocationsFilterControllerProtocol? { get set }
}

//MARK: LocationsFilterController Protocol
protocol LocationsFilterControllerProtocol: AnyObject {
    func filterLocationsByCities()
    func filterLocationsByShops()
}
