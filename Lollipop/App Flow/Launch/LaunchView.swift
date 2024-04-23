
//
//  LaunchView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class LaunchView: UIViewController, LaunchViewProtocol {

    var presenter: LaunchPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //presenter?.viewDidLoad()
    }

}
