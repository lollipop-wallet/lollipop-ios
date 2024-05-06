//
//  LocationsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol LocationsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, LocationCellProtocol {
    
    var interactor: LocationsInputInteractorProtocol? { get set }
    var view: LocationsViewProtocol? { get set }
    var wireframe:LocationsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LocationsInputInteractorProtocol: AnyObject {
    
    var presenter: LocationsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LocationsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol LocationsViewProtocol: AnyObject {
    
    var presenter: LocationsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol LocationsWireframeProtocol: AnyObject {

    
}

//MARK: LocationCell Protocol
protocol LocationCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
