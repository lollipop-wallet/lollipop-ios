//
//  LocationsFilterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class LocationsFilterPresenter: NSObject, LocationsFilterPresenterProtocol  {
    
    var interactor : LocationsFilterInputInteractorProtocol?
    weak var view: LocationsFilterViewProtocol?
    var wireframe: LocationsFilterWireframeProtocol?
    
    var filterType: LocationFilterType?
    var delegate: LocationsFilterControllerProtocol?
    
    var cities = [City]()
    var brands = [Brand]()
    var partnerId = Int()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func reset() {
        if self.filterType == .city {
            self.cities.indices.forEach { self.cities[$0].selected = false }
            self.view?.reload()
            let selectedBrands = self.brands.filter { $0.selected ?? false }.map { String($0.id ?? 0) }.joined(separator: ",")
            self.interactor?.getLocations(partnerId: self.partnerId, brands: selectedBrands, cities: "")
        }else{
            self.brands.indices.forEach { self.brands[$0].selected = false }
            self.view?.reload()
            let selectedCities = self.cities.filter { $0.selected ?? false }.map { $0.cityName ?? "" }.joined(separator: ",")
            self.interactor?.getLocations(partnerId: self.partnerId, brands: "", cities: selectedCities)
        }
    }
}

extension LocationsFilterPresenter: LocationsFilterOutputInteractorProtocol {
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand], partnerId: Int){
        self.filterType = filterType
        self.delegate = delegate
        self.cities = cities
        self.brands = brands
        self.partnerId = partnerId
        self.view?.setTitleLabelWith(title: filterType == .city ? LocalizedTitle.chooseCity.localized : LocalizedTitle.chooseShop.localized)
    }
    
    func parseLocationsData(result: Result<LocationsModel, AFError>){
        switch result {
        case .success(let model):
            delegate?.filterWith(locations: model.locations ?? [], cities: self.cities, brands: self.brands)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UITableViewDelegate&Datasource
extension LocationsFilterPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filterType == .city ? self.cities.count : self.brands.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.locationFilterCell.rawValue, for: indexPath) as! LocationsFilterTableViewCell
        if self.filterType == .city {
            cell.configureWithCity(city: self.cities[indexPath.row], index: indexPath, delegate: self)
        }else{
            cell.configureWithBrand(brand: self.brands[indexPath.row], index: indexPath, delegate: self)
        }
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        if self.filterType == .city {
            var item = self.cities[index.row]
            item.selected = !(item.selected ?? false)
            self.cities[index.row] = item
            self.view?.reload()
            let selectedCities = self.cities.filter { $0.selected ?? false }.map { $0.cityName ?? "" }.joined(separator: ",")
            let selectedBrands = self.brands.filter { $0.selected ?? false }.map { String($0.id ?? 0) }.joined(separator: ",")
            interactor?.getLocations(partnerId: self.partnerId, brands: selectedBrands, cities: selectedCities)
        }else{
            var item = self.brands[index.row]
            item.selected = !(item.selected ?? false)
            self.brands[index.row] = item
            self.view?.reload()
            let selectedCities = self.cities.filter { $0.selected ?? false }.map { $0.cityName ?? "" }.joined(separator: ",")
            let selectedBrands = self.brands.filter { $0.selected ?? false }.map { String($0.id ?? 0) }.joined(separator: ",")
            interactor?.getLocations(partnerId: self.partnerId, brands: selectedBrands, cities: selectedCities)
        }
    }
}
