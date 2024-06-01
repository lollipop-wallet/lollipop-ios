//
//  LocationsFilterPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LocationsFilterPresenter: NSObject, LocationsFilterPresenterProtocol  {
    
    var interactor : LocationsFilterInputInteractorProtocol?
    weak var view: LocationsFilterViewProtocol?
    var wireframe: LocationsFilterWireframeProtocol?
    
    var filterType: LocationFilterType?
    var delegate: LocationsFilterControllerProtocol?
    
    var cities = [City]()
    var brands = [Brand]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension LocationsFilterPresenter: LocationsFilterOutputInteractorProtocol {
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?, cities: [City], brands: [Brand]){
        self.filterType = filterType
        self.delegate = delegate
        self.cities = cities
        self.brands = brands
        self.view?.setTitleLabelWith(title: filterType == .city ? LocalizedTitle.chooseCity.localized : LocalizedTitle.chooseShop.localized)
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
        }else{
            var item = self.brands[index.row]
            item.selected = !(item.selected ?? false)
            self.brands[index.row] = item
            self.view?.reload()
        }
    }
}
