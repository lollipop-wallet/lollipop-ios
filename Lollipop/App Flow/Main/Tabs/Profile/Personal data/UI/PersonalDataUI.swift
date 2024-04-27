//
//  PersonalDataUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import UIKit

extension PersonalDataView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PersonalDataWireframe.createModule(PersonalDataRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.personalData.localized
        
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
        self.nameField.leftSuplementaryIconHidden = true
        
        self.surnameField.title = "\(LocalizedTitle.surname.localized):"
        self.surnameField.errorHidden = true
        self.surnameField.keyboardType = .default
        self.surnameField.background = AppColors.white
        self.surnameField.leftSuplementaryIconHidden = true

        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white
        self.emailField.leftSuplementaryIconHidden = true
        
        self.calendarField.title = "\(LocalizedTitle.dateOfBirh.localized):"
        self.calendarField.errorHidden = true
        self.calendarField.background = AppColors.white
        self.calendarField.text = LocalizedTitle.choose.localized
        self.calendarField.rightSuplementaryIconHidden = false
        self.calendarField.rightSuplementaryIcon = UIImage(named: AssetTitles.calendarIcon)
        self.calendarField.rightSuplementaryIconTintColor = AppColors.darkGrey
        self.calendarField.delegate = presenter
        
        self.datePicker.preferredDatePickerStyle = .inline
        self.datePicker.datePickerMode = .date
        self.datePicker.tintColor = AppColors.mediumGrey
        self.datePicker.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)

        self.genderField.title = "\(LocalizedTitle.gender.localized):"
        self.genderField.errorHidden = true
        self.genderField.background = AppColors.white
        self.genderField.text = LocalizedTitle.choose.localized
        self.genderField.rightSuplementaryIconHidden = false
        self.genderField.delegate = presenter
        
        lazy var midStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.calendarField, self.genderField])
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.alignment = .fill
            stack.spacing = 8
            return stack
        }()

        lazy var datePickerPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(self.datePicker)
            self.datePicker.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(5)
                make.trailing.bottom.equalToSuperview().offset(-5)
            }
            view.backgroundColor = AppColors.black.withAlphaComponent(0.5)
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
            return view
        }()
        
        self.datePickerStackView = UIStackView(arrangedSubviews: [datePickerPlaceholder])
        self.datePickerStackView.axis = .vertical
        self.datePickerStackView.distribution = .fill
        self.datePickerStackView.alignment = .fill
        self.datePickerStackView.isHidden = true
        
        self.cityField.title = "\(LocalizedTitle.city.localized)(\(LocalizedTitle.optional.localized)):"
        self.cityField.errorHidden = true
        self.cityField.background = AppColors.white
        self.cityField.text = LocalizedTitle.choose.localized
        self.cityField.rightSuplementaryIconHidden = false
        self.cityField.delegate = presenter
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.nameField, self.surnameField, self.emailField, midStack, self.cityField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var proceedButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onProceedTap), for: .touchUpInside)
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
        
        self.view.addSubview(self.datePickerStackView)
        self.datePickerStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(self.calendarField.snp.top).offset(-5)
            make.top.equalTo(self.view.safeAreaLayoutGuide)
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
