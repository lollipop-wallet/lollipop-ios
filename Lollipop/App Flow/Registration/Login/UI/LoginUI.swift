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
        self.emailField.rightSuplementaryIconHidden = true
        
        self.passwordField.title = "\(LocalizedTitle.enterPassword.localized):"
        self.passwordField.errorHidden = true
        self.passwordField.keyboardType = .default
        self.passwordField.background = AppColors.white
        self.passwordField.leftSuplementaryIconHidden = true
        self.passwordField.isSecureTextEntry = true
        self.passwordField.rightSuplementaryIconHidden = false
        self.passwordField.rightSuplementaryIcon = UIImage(named: AssetTitles.passwordHiddenIcon)
        self.passwordField.delegate = presenter
        
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
        
        lazy var noLollyAccountLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.text = LocalizedTitle.noLollypopAccount.localized
            label.textAlignment = .left
            return label
        }()
        
        lazy var registerLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .bold)
            label.textColor = AppColors.link
            label.text = LocalizedTitle.register.localized
            label.textAlignment = .left
            return label
        }()
        
        lazy var noLollyAccountTextStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [noLollyAccountLabel, registerLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var arrowIcon: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: AssetTitles.arrowRightIcon)
            image.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            image.tintColor = AppColors.black
            return image
        }()
        
        lazy var noLollyAccountMainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [noLollyAccountTextStack, arrowIcon])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var noLollyAccountButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onNoLollyAccountButtonTap), for: .touchUpInside)
            return button
        }()

        lazy var noLollyAccountPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPowder
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.addSubview(noLollyAccountMainStack)
            noLollyAccountMainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(12)
                make.trailing.equalToSuperview().offset(-12)
                make.top.equalToSuperview().offset(16)
                make.bottom.equalToSuperview().offset(-16)
            }
            view.addSubview(noLollyAccountButton)
            noLollyAccountButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            return view
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
        
        self.view.addSubview(noLollyAccountPlaceholderView)
        noLollyAccountPlaceholderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(proceedButton.snp.bottom).offset(32)
            make.height.equalTo(74)
        }
    }
}
