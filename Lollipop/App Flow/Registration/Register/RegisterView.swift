
//
//  RegisterView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class RegisterView: UIViewController, RegisterViewProtocol {

    var presenter: RegisterPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
