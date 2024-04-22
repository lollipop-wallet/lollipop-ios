
//
//  OnboardingView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class OnboardingView: UIViewController, OnboardingViewProtocol {

    var presenter: OnboardingPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
