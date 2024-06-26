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
    var cities = [City]()
    var brands = [Brand]()
    var startingBrands = [Brand]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func cityFilter(){
        wireframe?.toFilterWith(filterType: .city, delegate: self, cities: self.cities, brands: self.brands, partnerId: self.partner?.id ?? 0)
    }
    
    func shopFilter(){
        wireframe?.toFilterWith(filterType: .shop, delegate: self, cities: self.cities, brands: self.brands, partnerId: self.partner?.id ?? 0)
    }
    
}

extension LocationsPresenter: LocationsOutputInteractorProtocol {
    func takeData(partner: Partner?, brands: [Brand]?){
        self.partner = partner
        self.startingBrands = brands ?? []
        let selectedBrands = (brands ?? []).map { String($0.id ?? 0) }.joined(separator: ",")
        interactor?.getLocations(partnerId: partner?.id ?? 0, brands: selectedBrands, cities: "")
    }
    
    func parseLocationsData(result: Result<LocationsModel, AFError>){
        switch result {
        case .success(let model):
            self.backupDatasource = model.locations ?? []
            self.datasource = model.locations ?? []
            self.view?.reload()
            for i in 0..<(model.cities ?? []).count {
                let item = (model.cities ?? [])[i]
                let city = City(cityName: item, selected: true)
                self.cities.append(city)
            }
            self.brands = model.brands ?? []
            var finalBrands = [Brand]()
            if !startingBrands.isEmpty {
                for i in 0..<self.brands.count {
                    var oneBrand = self.brands[i]
                    let filteredPreselectedBrands = self.startingBrands.filter { ($0.alias ?? "") == oneBrand.alias}
                    oneBrand.selected = !filteredPreselectedBrands.isEmpty
                    finalBrands.append(oneBrand)
                }
                self.brands = finalBrands
            }
            self.view?.setCityLabelWith(text: "\(LocalizedTitle.cities.localized): (\(self.cities.count))")
            self.view?.setBrandLabelWith(text: "\(LocalizedTitle.stores.localized): (\(self.brands.count))")
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
        let item = self.datasource[index.row]
        wireframe?.toMapWith(location: item)
    }
}

//MARK: LocationsFilter Delegate
extension LocationsPresenter {
    func filterWith(locations: [Location], cities: [City], brands: [Brand]){
        self.datasource = locations
        self.cities = cities
        self.brands = brands
        self.view?.setCityLabelWith(text: "\(LocalizedTitle.cities.localized): (\(self.cities.count))")
        self.view?.setBrandLabelWith(text: "\(LocalizedTitle.stores.localized): (\(self.brands.count))")
        self.view?.reload()
    }
}
