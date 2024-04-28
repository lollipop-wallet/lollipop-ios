
//
//  ChangePasswordView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ChangePasswordView: UIViewController, ChangePasswordViewProtocol {
    
    var currentPasswordField = InputField()
    var newPasswordField = InputField()
    var confirmPasswordField = InputField()

    var presenter: ChangePasswordPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSaveTap() {
    }
}
