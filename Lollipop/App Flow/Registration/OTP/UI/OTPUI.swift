//
//  OTPUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 25.4.24..
//

import UIKit

extension OTPView {
    func setup() {
        OTPWireframe.createModule(OTPRef: self)
        self.view.backgroundColor = AppColors.lightGrey
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 16, name: .regular)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.confirmEmailAdderss.localized
        
        lazy var closeButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.closeIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onCloseTap)
            button.target = self
            return button
        }()

        self.backButton.image = UIImage(named: AssetTitles.backIcon)
        self.backButton.tintColor = AppColors.black
        self.backButton.action = #selector(self.onBackTap)
        self.backButton.target = self
        
        self.navigationItem.rightBarButtonItems = [closeButton]

        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 22, name: .bold)
            label.textAlignment = .left
            label.text = LocalizedTitle.activationCodeTitle.localized
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        self.subtitleLabel.textAlignment = .left
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.lineBreakMode = .byWordWrapping
        
        self.firstOTPField.background = AppColors.white
        self.firstOTPField.font = .inter(ofSize: 28, name: .bold)
        self.firstOTPField.keyboardType = .numberPad
        self.firstOTPField.fieldTag = 1
        self.firstOTPField.delegate = presenter
        
        self.secondOTPField.background = AppColors.white
        self.secondOTPField.font = .inter(ofSize: 28, name: .bold)
        self.secondOTPField.keyboardType = .numberPad
        self.secondOTPField.fieldTag = 2
        self.secondOTPField.delegate = presenter
        
        self.thirdOTPField.background = AppColors.white
        self.thirdOTPField.font = .inter(ofSize: 28, name: .bold)
        self.thirdOTPField.keyboardType = .numberPad
        self.thirdOTPField.fieldTag = 3
        self.thirdOTPField.delegate = presenter
        
        self.fourthOTPField.background = AppColors.white
        self.fourthOTPField.font = .inter(ofSize: 28, name: .bold)
        self.fourthOTPField.keyboardType = .numberPad
        self.fourthOTPField.fieldTag = 4
        self.fourthOTPField.delegate = presenter
        
        lazy var otpStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.firstOTPField, self.secondOTPField, self.thirdOTPField, self.fourthOTPField])
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.spacing = 10
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
        
        self.requestNewCodeButton.addTarget(self, action: #selector(onRequestNewCodeTap), for: .touchUpInside)
        self.requestNewCodeButton.setTitle(LocalizedTitle.sendNewCode.localized, for: .normal)
        self.requestNewCodeButton.titleLabel?.font = .inter(ofSize: 16, name: .semibold)
        self.requestNewCodeButton.setTitleColor(AppColors.brandPrimary, for: .normal)
        
        self.requestNewCodeTimerLabel.isHidden = true

        lazy var newCodeStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.requestNewCodeButton, self.requestNewCodeTimerLabel])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 0
            return stack
        }()
                
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
        
        self.view.addSubview(self.subtitleLabel)
        self.subtitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        self.view.addSubview(otpStack)
        otpStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.subtitleLabel.snp.bottom).offset(32)
            make.height.equalTo((self.view.frame.width - 70) / 4)
        }
        
        self.view.addSubview(proceedButton)
        proceedButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(otpStack.snp.bottom).offset(32)
            make.height.equalTo(48)
        }
        
        self.view.addSubview(newCodeStack)
        newCodeStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(proceedButton.snp.bottom).offset(24)
            make.height.equalTo(20)
        }
    }
}
