
//
//  ForgotPwdEmailView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ForgotPwdEmailView: UIViewController, ForgotPwdEmailViewProtocol {
    
    var emailField = InputField()

    var presenter: ForgotPwdEmailPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Actions
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
    
    @objc func onProceedTap() {
    }
}
