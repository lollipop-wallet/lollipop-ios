//
//  LoginUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 21.5.24..
//

import UIKit

extension LoginView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        LoginWireframe.createModule(LoginRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.signIn.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white
        self.emailField.leftSuplementaryIconHidden = true
        
        self.passwordField.title = "\(LocalizedTitle.enterPassword.localized):"
        self.passwordField.errorHidden = true
        self.passwordField.keyboardType = .default
        self.passwordField.background = AppColors.white
        self.passwordField.leftSuplementaryIconHidden = true
        self.passwordField.isSecureTextEntry = true
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.emailField, self.passwordField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var forgottenPwdButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onForgotPwdTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.forgottenPwd.localized, for: .normal)
            button.titleLabel?.font = .inter(ofSize: 16, name: .bold)
            button.setTitleColor(AppColors.link, for: .normal)
            button.contentMode = .right
            return button
        }()
        
        lazy var proceedButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onProceedTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.cont.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()

        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        }
        
        self.view.addSubview(forgottenPwdButton)
        forgottenPwdButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(mainStack.snp.bottom).offset(12)
            make.height.equalTo(20)
        }
        
        self.view.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(forgottenPwdButton.snp.bottom).offset(32)
            make.height.equalTo(48)
        }
    }
}
