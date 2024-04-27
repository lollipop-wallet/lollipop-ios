
//
//  PersonalDataView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PersonalDataView: UIViewController, PersonalDataViewProtocol {

    var presenter: PersonalDataPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
