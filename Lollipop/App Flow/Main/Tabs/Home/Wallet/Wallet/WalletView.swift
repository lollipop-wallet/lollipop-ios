
//
//  WalletView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class WalletView: UIViewController, WalletViewProtocol {

    var presenter: WalletPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
}
