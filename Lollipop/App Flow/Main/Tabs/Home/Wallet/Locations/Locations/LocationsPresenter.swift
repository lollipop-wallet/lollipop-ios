//
//  LocationsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsPresenter: NSObject, LocationsPresenterProtocol  {
    
    var interactor : LocationsInputInteractorProtocol?
    weak var view: LocationsViewProtocol?
    var wireframe: LocationsWireframeProtocol?
    
    func cityFilter(){
        wireframe?.toFilterWith(filterType: .city, delegate: self)
    }
    
    func shopFilter(){
        wireframe?.toFilterWith(filterType: .shop, delegate: self)
    }
}

extension LocationsPresenter: LocationsOutputInteractorProtocol {
    
}

//MARK: UITableViewDelegate&Datasource
extension LocationsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.locationCell.rawValue, for: indexPath) as! LocationTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
    }
}

//MARK: LocationsFilter Delegate
extension LocationsPresenter {
    func filterLocationsByCities() {
        
    }
    
    func filterLocationsByShops() {
        
    }
}
