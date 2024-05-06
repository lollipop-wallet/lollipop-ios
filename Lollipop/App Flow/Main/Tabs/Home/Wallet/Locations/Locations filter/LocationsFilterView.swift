
//
//  LocationsFilterView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class LocationsFilterView: UIViewController, LocationsFilterViewProtocol {
    
    var titleLabel = UILabel()
    var tableView = AutomaticHeightTableView()

    var presenter: LocationsFilterPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: LocationsFilterView Protocol
    func setTitleLabelWith(title: String){
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }

    //MARK: Actions
    @objc func reset() {
        
    }
}
