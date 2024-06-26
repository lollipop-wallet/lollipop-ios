
//
//  LocationsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 05/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class LocationsView: UIViewController, LocationsViewProtocol {
    
    var locationCityLabel = UILabel()
    var locationShopLabel = UILabel()
    var tableView = UITableView()

    var presenter: LocationsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: LocationsView protocol
    func reload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setCityLabelWith(text: String){
        DispatchQueue.main.async {
            self.locationCityLabel.text = text
        }
    }
    
    func setBrandLabelWith(text: String){
        DispatchQueue.main.async {
            self.locationShopLabel.text = text
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onCityTap() {
        self.presenter?.cityFilter()
    }
    
    @objc func onShopTap() {
        self.presenter?.shopFilter()
    }
}
