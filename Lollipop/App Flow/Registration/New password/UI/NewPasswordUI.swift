//
//  NewPasswordUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 24.5.24..
//

import UIKit

extension NewPasswordView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        NewPasswordWireframe.createModule(NewPasswordRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 16, name: .regular)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.forgottenPwd.localized
        
        lazy var closeButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.closeIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onCloseTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [closeButton]

        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 22, name: .bold)
            label.textAlignment = .left
            label.text = LocalizedTitle.createNewPwd.localized
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        self.passwordField.title = "\(LocalizedTitle.enterNewPwd.localized):"
        self.passwordField.errorHidden = true
        self.passwordField.keyboardType = .default
        self.passwordField.background = AppColors.white
        self.passwordField.leftSuplementaryIconHidden = true
        self.passwordField.isSecureTextEntry = true
        self.passwordField.rightSuplementaryIconHidden = false
        self.passwordField.rightSuplementaryIcon = UIImage(named: AssetTitles.passwordHiddenIcon)
        self.passwordField.tag = 0
        self.passwordField.delegate = presenter
        
        self.confirmPasswordField.title = "\(LocalizedTitle.confirmNewPwd.localized):"
        self.confirmPasswordField.errorHidden = true
        self.confirmPasswordField.keyboardType = .default
        self.confirmPasswordField.background = AppColors.white
        self.confirmPasswordField.leftSuplementaryIconHidden = true
        self.confirmPasswordField.isSecureTextEntry = true
        self.confirmPasswordField.rightSuplementaryIconHidden = false
        self.confirmPasswordField.rightSuplementaryIcon = UIImage(named: AssetTitles.passwordHiddenIcon)
        self.confirmPasswordField.tag = 1
        self.confirmPasswordField.delegate = presenter
        
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
        
        lazy var containerView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        containerView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        }
        
        containerView.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(mainStack.snp.bottom).offset(32)
            make.height.equalTo(48)
        }
    }
}
