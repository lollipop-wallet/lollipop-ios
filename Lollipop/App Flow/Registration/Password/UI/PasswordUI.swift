//
//  PasswordUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 25/04/2024.
//

import UIKit

extension PasswordView {
    func setup() {
        PasswordWireframe.createModule(PasswordRef: self)
        self.view.backgroundColor = AppColors.lightGrey
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.passwordCreation.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.passwordField.title = "\(LocalizedTitle.enterPassword.localized):"
        self.passwordField.errorHidden = true
        self.passwordField.keyboardType = .default
        self.passwordField.background = AppColors.white
        self.passwordField.leftSuplementaryIconHidden = true
        self.passwordField.isSecureTextEntry = true
        
        self.confirmPasswordField.title = "\(LocalizedTitle.confirmPassword.localized):"
        self.confirmPasswordField.errorHidden = true
        self.confirmPasswordField.keyboardType = .default
        self.confirmPasswordField.background = AppColors.white
        self.confirmPasswordField.leftSuplementaryIconHidden = true
        self.confirmPasswordField.isSecureTextEntry = true
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.passwordField, self.confirmPasswordField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
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
        
        self.view.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(mainStack.snp.bottom).offset(54.5)
            make.height.equalTo(48)
        }
    }
}
