
//
//  ScanSuggestionView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ScanSuggestionView: UIViewController, ScanSuggestionViewProtocol {

    var presenter: ScanSuggestionPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
