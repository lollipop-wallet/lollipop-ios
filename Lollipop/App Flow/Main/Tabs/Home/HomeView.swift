
//
//  HomeView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class HomeView: UIViewController, HomeViewProtocol {

    var presenter: HomePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
