
//
//  LoginView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class LoginView: UIViewController, LoginViewProtocol {
    
    var emailField = InputField()
    var passwordField = InputField()

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: LoginView protocol
    func setShowHidePassword(){
        self.passwordField.isSecureTextEntry = (self.passwordField.isSecureTextEntry ?? false)
        self.passwordField.rightSuplementaryIcon = UIImage(named: (self.passwordField.isSecureTextEntry ?? false) ? AssetTitles.passwordShownIcon : AssetTitles.passwordHiddenIcon)
    }
    
    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onForgotPwdTap() {
    }

    @objc func onProceedTap() {
        //presenter?.proceed()
    }
    
    @objc func onNoLollyAccountButtonTap() {
        presenter?.register()
    }

}
