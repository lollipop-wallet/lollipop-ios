
//
//  PromotionDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PromotionDetailsView: UIViewController, PromotionDetailsViewProtocol {

    var presenter: PromotionDetailsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
