//
//  LocationsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class LocationsPresenter: NSObject, LocationsPresenterProtocol  {
    
    var interactor : LocationsInputInteractorProtocol?
    weak var view: LocationsViewProtocol?
    var wireframe: LocationsWireframeProtocol?
    
    var partner: Partner?
    var backupDatasource = [Location]()
    var datasource = [Location]()
    var cities = [String]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func cityFilter(){
        wireframe?.toFilterWith(filterType: .city, delegate: self)
    }
    
    func shopFilter(){
        wireframe?.toFilterWith(filterType: .shop, delegate: self)
    }
    
}

extension LocationsPresenter: LocationsOutputInteractorProtocol {
    func takeData(partner: Partner?) {
        self.partner = partner
        interactor?.getLocations(partnerId: partner?.id ?? 0, brands: "", cities: "")
    }
    
    func parseLocationsData(result: Result<LocationsModel, AFError>){
        switch result {
        case .success(let model):
            self.backupDatasource = model.locations ?? []
            self.datasource = model.locations ?? []
            self.cities = model.cities ?? []
            self.view?.reload()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UITableViewDelegate&Datasource
extension LocationsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.locationCell.rawValue, for: indexPath) as! LocationTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
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
