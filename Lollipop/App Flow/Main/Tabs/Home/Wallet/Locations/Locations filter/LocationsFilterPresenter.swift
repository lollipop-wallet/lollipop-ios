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
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension LocationsFilterPresenter: LocationsFilterOutputInteractorProtocol {
    func takeDataWith(filterType: LocationFilterType?, delegate: LocationsFilterControllerProtocol?){
        self.filterType = filterType
        self.delegate = delegate
        self.view?.setTitleLabelWith(title: filterType == .city ? LocalizedTitle.chooseCity.localized : LocalizedTitle.chooseShop.localized)
    }
}

//MARK: UITableViewDelegate&Datasource
extension LocationsFilterPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.locationFilterCell.rawValue, for: indexPath) as! LocationsFilterTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
    }
}
