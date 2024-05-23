//
//  ForgotPasswordEmailUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23.5.24..
//

import UIKit

extension ForgotPwdEmailView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        ForgotPwdEmailWireframe.createModule(ForgotPwdEmailRef: self)
        
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
            label.text = LocalizedTitle.enterEmailForPwdChange.localized
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white
        self.emailField.leftSuplementaryIconHidden = true
        self.emailField.leftSuplementarylabelHidden = true
        self.emailField.rightSuplementaryIconHidden = true
        
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
                
        containerView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
        
        containerView.addSubview(self.emailField)
        self.emailField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
        }
        
        containerView.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.emailField.snp.bottom).offset(32)
            make.height.equalTo(48)
        }

    }
}
