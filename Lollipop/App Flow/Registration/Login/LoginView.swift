
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
    
    func validate(isEmailEmpty: Bool, isPwdEmpty: Bool){
        self.emailField.borderWidth = 1
        self.emailField.borderColor = isEmailEmpty ? AppColors.error : AppColors.black
        self.passwordField.borderWidth = 1
        self.passwordField.borderColor = isPwdEmpty ? AppColors.error : AppColors.black
    }
    
    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onForgotPwdTap() {
    }

    @objc func onProceedTap() {
        presenter?.login(email: self.emailField.textField.text ?? "", password: self.passwordField.textField.text ?? "")
    }
    
    @objc func onNoLollyAccountButtonTap() {
        presenter?.register()
    }

}
