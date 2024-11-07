//
//  ChangePasswordUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import UIKit

extension ChangePasswordView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ChangePasswordWireframe.createModule(ChangePasswordRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.passwordChange.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.currentPasswordField.title = "\(LocalizedTitle.currentPassword.localized):"
        self.currentPasswordField.errorHidden = true
        self.currentPasswordField.keyboardType = .default
        self.currentPasswordField.background = AppColors.white
        self.currentPasswordField.leftSuplementaryIconHidden = true
        self.currentPasswordField.isSecureTextEntry = true
        
        self.newPasswordField.title = "\(LocalizedTitle.newPassword.localized):"
        self.newPasswordField.errorHidden = true
        self.newPasswordField.keyboardType = .default
        self.newPasswordField.background = AppColors.white
        self.newPasswordField.leftSuplementaryIconHidden = true
        self.newPasswordField.isSecureTextEntry = true
        
        self.confirmPasswordField.title = "\(LocalizedTitle.repeatPassword.localized):"
        self.confirmPasswordField.errorHidden = true
        self.confirmPasswordField.keyboardType = .default
        self.confirmPasswordField.background = AppColors.white
        self.confirmPasswordField.leftSuplementaryIconHidden = true
        self.confirmPasswordField.isSecureTextEntry = true
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.currentPasswordField, self.newPasswordField, self.confirmPasswordField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var proceedButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onSaveTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.save.localized, for: .normal)
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
