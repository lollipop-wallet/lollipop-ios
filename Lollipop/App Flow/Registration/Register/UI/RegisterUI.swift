//
//  RegisterUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 24.4.24..
//

import UIKit

extension RegisterView {
    func setup() {
        RegisterWireframe.createModule(RegisterRef: self)
        self.view.backgroundColor = AppColors.lightGrey
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.newUser.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
     
        self.nameField.title = "\(LocalizedTitle.name.localized):"
        self.nameField.errorHidden = true
        self.nameField.keyboardType = .default
        self.nameField.background = AppColors.white
        
        self.surnameField.title = "\(LocalizedTitle.surname.localized):"
        self.surnameField.errorHidden = true
        self.surnameField.keyboardType = .default
        self.surnameField.background = AppColors.white

        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white

        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.nameField, self.surnameField, self.emailField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        }
    }
}
