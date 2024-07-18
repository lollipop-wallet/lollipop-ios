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
        self.nameField.leftSuplementaryIconHidden = true
        self.nameField.rightSuplementaryIconHidden = true
        self.nameField.leftSuplementarylabelHidden = true
        
        self.surnameField.title = "\(LocalizedTitle.surname.localized):"
        self.surnameField.errorHidden = true
        self.surnameField.keyboardType = .default
        self.surnameField.background = AppColors.white
        self.surnameField.leftSuplementaryIconHidden = true
        self.surnameField.rightSuplementaryIconHidden = true
        self.surnameField.leftSuplementarylabelHidden = true
        
        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white
        self.emailField.leftSuplementaryIconHidden = true
        self.emailField.leftSuplementarylabelHidden = true
        self.emailField.rightSuplementaryIconHidden = true
        self.emailField.textField.autocapitalizationType = .none
        
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
        self.genderField.leftSuplementaryIconHidden = true
        self.genderField.tag = 0
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
        
        self.cityField.title = "\(LocalizedTitle.cityYouLiveIn.localized) (\(LocalizedTitle.optional.localized)):"
        self.cityField.errorHidden = true
        self.cityField.background = AppColors.white
        self.cityField.text = LocalizedTitle.choose.localized
        self.cityField.rightSuplementaryIconHidden = false
        self.cityField.leftSuplementaryIconHidden = true
        self.cityField.tag = 1
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
            button.setTitle(LocalizedTitle.cont.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        lazy var alreadyHaveAccountLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.text = LocalizedTitle.alreadyHaveAnAccount.localized
            label.textAlignment = .left
            return label
        }()
        
        lazy var signInLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .bold)
            label.textColor = AppColors.link
            label.text = LocalizedTitle.signIn.localized
            label.textAlignment = .left
            return label
        }()
        
        lazy var alreadyHaveAccountStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [alreadyHaveAccountLabel, signInLabel])
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
        
        lazy var alreadyHaveAccountMainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [alreadyHaveAccountStack, arrowIcon])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var alreadyHaveAccountButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAlreadyHaveAccountTap), for: .touchUpInside)
            return button
        }()

        lazy var alreadyHaveAnAccountPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPowder
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.addSubview(alreadyHaveAccountMainStack)
            alreadyHaveAccountMainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(12)
                make.trailing.equalToSuperview().offset(-12)
                make.top.equalToSuperview().offset(16)
                make.bottom.equalToSuperview().offset(-16)
            }
            view.addSubview(alreadyHaveAccountButton)
            alreadyHaveAccountButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            return view
        }()
        
        self.genderDropdown.cellNib = UINib(nibName: "GenderTableViewCell", bundle: nil)
        self.genderDropdown.anchorView = self.genderField
        self.genderDropdown.cellHeight = 48
        self.genderDropdown.direction = .bottom
        self.genderDropdown.bottomOffset = CGPoint(x: 0, y: 85)
        self.genderDropdown.backgroundColor = AppColors.white
        self.genderDropdown.cornerRadius = 8
        self.genderDropdown.dismissMode = .onTap
        self.genderDropdown.tag = 0
        self.genderDropdown.delegate = presenter
        
        let genderDatasource = (Config.model.genders ?? []).map { $0.label ?? "" }
        self.genderDropdown.dataSource = genderDatasource
        
        self.genderDropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? GenderTableViewCell else { return }
            cell.genderLabel.text = item
        }
//        
        self.genderDropdown.selectionAction = { [weak self] (index, item) in
            guard let self = self else {return}
            self.presenter?.handleGenderDropdownTapWith(item: (Config.model.genders ?? [])[index])
        }
        
        self.cityDropdown.cellNib = UINib(nibName: "CityTableViewCell", bundle: nil)
        self.cityDropdown.anchorView = self.cityField
        self.cityDropdown.cellHeight = 48
        self.cityDropdown.direction = .bottom
        self.cityDropdown.bottomOffset = CGPoint(x: 0, y: 85)
        self.cityDropdown.backgroundColor = AppColors.white
        self.cityDropdown.cornerRadius = 8
        self.cityDropdown.dismissMode = .onTap
        self.cityDropdown.tag = 1
        self.cityDropdown.delegate = presenter
        
        let cityDatasource = (Config.model.cities ?? [])
        self.cityDropdown.dataSource = cityDatasource
        
        self.cityDropdown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? CityTableViewCell else { return }
            cell.cityNameLabel.text = item
        }
//
        self.cityDropdown.selectionAction = { [weak self] (index, item) in
            guard let self = self else {return}
            self.presenter?.handleCityDropdownTapWith(item: item)
        }
        
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
            make.top.equalTo(mainStack.snp.bottom).offset(32)
            make.height.equalTo(48)
        }
        
        self.view.addSubview(alreadyHaveAnAccountPlaceholderView)
        alreadyHaveAnAccountPlaceholderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(proceedButton.snp.bottom).offset(32)
            make.height.equalTo(74)
        }
    }
}
