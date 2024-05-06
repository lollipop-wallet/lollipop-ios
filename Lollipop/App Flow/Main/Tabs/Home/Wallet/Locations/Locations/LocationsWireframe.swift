//
//  LocationsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import FittedSheets

class LocationsWireframe: LocationsWireframeProtocol {
    
    
    static func createModule(LocationsRef: LocationsView) {
        let presenter: LocationsPresenterProtocol & LocationsOutputInteractorProtocol = LocationsPresenter()
        LocationsRef.presenter = presenter
        LocationsRef.presenter?.wireframe = LocationsWireframe()
        LocationsRef.presenter?.view = LocationsRef
        LocationsRef.presenter?.interactor = LocationsInteractor()
        LocationsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toFilterWith(filterType: LocationFilterType) {
        let vc = LocationsFilterView()
        LocationsFilterWireframe.filterType = filterType
        let sheetController = SheetViewController(controller: vc, sizes: [.fixed(200)], options: Configuration().options)
        sheetController.allowPullingPastMaxHeight = false
        UIApplication.topViewController()?.present(sheetController, animated: true, completion: nil)
    }
}
