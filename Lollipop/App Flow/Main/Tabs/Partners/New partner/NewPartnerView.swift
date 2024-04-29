
//
//  NewPartnerView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class NewPartnerView: UIViewController, NewPartnerViewProtocol {

    var presenter: NewPartnerPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
}
