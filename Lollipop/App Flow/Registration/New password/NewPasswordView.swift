
//
//  NewPasswordView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class NewPasswordView: UIViewController, NewPasswordViewProtocol {

    var passwordField = InputField()
    var confirmPasswordField = InputField()
    
    var presenter: NewPasswordPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: NewPasswordView protocol
    func setShowHidePassword(tag: Int){
        if tag == 0 {
            self.passwordField.isSecureTextEntry = (self.passwordField.isSecureTextEntry ?? false)
            self.passwordField.rightSuplementaryIcon = UIImage(named: (self.passwordField.isSecureTextEntry ?? false) ? AssetTitles.passwordShownIcon : AssetTitles.passwordHiddenIcon)
        }else{
            self.confirmPasswordField.isSecureTextEntry = (self.confirmPasswordField.isSecureTextEntry ?? false)
            self.confirmPasswordField.rightSuplementaryIcon = UIImage(named: (self.confirmPasswordField.isSecureTextEntry ?? false) ? AssetTitles.passwordShownIcon : AssetTitles.passwordHiddenIcon)
        }
    }
    
    func validate(isPwdEmpty: Bool, isConfirmPwdEmpty: Bool){
        self.passwordField.borderWidth = 1
        self.passwordField.borderColor = isPwdEmpty ? AppColors.error : AppColors.black
        self.confirmPasswordField.borderWidth = 1
        self.confirmPasswordField.borderColor = isPwdEmpty ? AppColors.error : AppColors.black
    }

    //MARK: Actions
    @objc func onCloseTap() {
        dismiss(animated: true)
    }
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onProceedTap() {
        presenter?.proceed(password: self.passwordField.textField.text ?? "", confirmPassword: self.confirmPasswordField.textField.text ?? "")
    }
}
