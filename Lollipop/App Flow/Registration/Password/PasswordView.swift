
//
//  PasswordView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PasswordView: UIViewController, PasswordViewProtocol {
    
    var passwordField = InputField()
    var confirmPasswordField = InputField()

    var presenter: PasswordPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: PasswordView protocol
    func setShowHidePassword(tag: Int){
        if tag == 0 {
            self.passwordField.isSecureTextEntry = (self.passwordField.isSecureTextEntry ?? false)
            self.passwordField.rightSuplementaryIcon = UIImage(named: (self.passwordField.isSecureTextEntry ?? false) ? AssetTitles.passwordShownIcon : AssetTitles.passwordHiddenIcon)
        }else{
            self.confirmPasswordField.isSecureTextEntry = (self.confirmPasswordField.isSecureTextEntry ?? false)
            self.confirmPasswordField.rightSuplementaryIcon = UIImage(named: (self.confirmPasswordField.isSecureTextEntry ?? false) ? AssetTitles.passwordShownIcon : AssetTitles.passwordHiddenIcon)
        }
    }

    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onProceedTap() {
        presenter?.proceed()
    }
}
