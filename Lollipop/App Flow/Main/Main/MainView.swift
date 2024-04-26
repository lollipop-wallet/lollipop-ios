
//
//  MainView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class MainView: UITabBarController, MainViewProtocol {

    var presenter: MainPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
