
//
//  AccountDeletionView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class AccountDeletionView: UIViewController, AccountDeletionViewProtocol {

    var presenter: AccountDeletionPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}
