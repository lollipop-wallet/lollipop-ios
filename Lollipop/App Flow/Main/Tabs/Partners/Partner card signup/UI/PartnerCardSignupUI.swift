//
//  PartnerCardSignupUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit
import SwiftyAttributes
//import DropDown

extension PartnerCardSignupView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        PartnerCardSignupWireframe.createModule(PartnerCardSignupRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        navigationItem.title = LocalizedTitle.cardDetails.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.cardImageView.contentMode = .scaleAspectFill
        self.cardImageView.layer.cornerRadius = 8
        self.cardImageView.layer.masksToBounds = true
        self.cardImageView.snp.makeConstraints { make in
            make.width.equalTo(180)
            make.height.equalTo(114)
        }
        self.cardImageView.backgroundColor = .red
        
        lazy var cardInfoLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = "\(LocalizedTitle.newPartnerCardInfo.localized):"
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardImageView, cardInfoLabel])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 24
            return stack
        }()
        
        lazy var dataPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(mainStack)
            mainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalToSuperview().offset(-24)
                make.top.equalToSuperview().offset(24)
            }
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        
        lazy var topPaddingView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            return view
        }()
        
        lazy var bottomView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            view.layer.shadowColor =  UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.1).cgColor
            view.layer.shadowOpacity = 1
            view.layer.shadowOffset = CGSize(width: 0, height: 8)
            view.layer.shadowRadius = 34
            return view
        }()
        
        lazy var shadowPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(topPaddingView)
            topPaddingView.snp.makeConstraints { make in
                make.leading.trailing.top.equalToSuperview()
                make.height.equalTo(74)
            }
            view.addSubview(bottomView)
            bottomView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalTo(topPaddingView.snp.bottom)
            }
            
            view.addSubview(dataPlaceholderView)
            dataPlaceholderView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }

            return view
        }()
        
        lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        self.nameField.title = "\(LocalizedTitle.nameAndSurname.localized):"
        self.nameField.errorHidden = true
        self.nameField.keyboardType = .default
        self.nameField.background = AppColors.white
        self.nameField.leftSuplementaryIconHidden = true
        self.nameField.placeholder = LocalizedTitle.enterNameAndSurname.localized
        
        self.cityField.title = "\(LocalizedTitle.city.localized):"
        self.cityField.errorHidden = true
        self.cityField.background = AppColors.white
        self.cityField.text = LocalizedTitle.choose.localized
        self.cityField.rightSuplementaryIconHidden = false
        //self.cityField.delegate = presenter
        
        self.phonePrefixField.title = "\(LocalizedTitle.phoneNumber.localized):"
        self.phonePrefixField.errorHidden = true
        self.phonePrefixField.background = AppColors.white
        self.phonePrefixField.text = LocalizedTitle.choose.localized
        self.phonePrefixField.rightSuplementaryIconHidden = false
        //self.phonePrefixField.isDropdownHidden = true
        self.phonePrefixField.delegate = presenter
        
        self.phoneField.title = " "
        self.phoneField.errorHidden = true
        self.phoneField.keyboardType = .phonePad
        self.phoneField.background = AppColors.white
        self.phoneField.leftSuplementaryIconHidden = true
        self.phoneField.placeholder = "+382"
        
        self.emailField.title = "\(LocalizedTitle.email.localized):"
        self.emailField.errorHidden = true
        self.emailField.keyboardType = .emailAddress
        self.emailField.background = AppColors.white
        self.emailField.leftSuplementaryIconHidden = true
        
        self.checkBoxIcon.image = UIImage(named: AssetTitles.checkBoxUnselectedIcon)
        
        lazy var checkButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onCheckboxTap), for: .touchUpInside)
            return button
        }()
        
        lazy var checkBoxPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(self.checkBoxIcon)
            self.checkBoxIcon.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.addSubview(checkButton)
            checkButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.white
            view.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return view
        }()
        
        self.termsLabel.attributedText = self.setupAttributedString()
        self.termsLabel.textAlignment = .left
        self.termsLabel.numberOfLines = 0
        self.termsLabel.lineBreakMode = .byWordWrapping
        self.termsLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(PartnerCardSignupView.onTermsLabelTap))
        self.termsLabel.addGestureRecognizer(tap)
        
        lazy var termsStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [checkBoxPlaceholder, self.termsLabel])
            stack.axis = .horizontal
            stack.alignment = .top
            stack.distribution = .fill
            stack.spacing = 14
            return stack
        }()
        
        lazy var sendButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onSendTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.send.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        self.phonePrefixField.snp.makeConstraints { make in
            make.width.equalTo(106)
        }
        
        self.phoneCodeDropDown.cellNib = UINib(nibName: "PhoneNumberPrefixTableViewCell", bundle: nil)
        self.phoneCodeDropDown.anchorView = self.emailField
        self.phoneCodeDropDown.cellHeight = 48
        self.phoneCodeDropDown.direction = .bottom
        self.phoneCodeDropDown.backgroundColor = AppColors.white
        self.phoneCodeDropDown.cornerRadius = 8
        self.phoneCodeDropDown.dismissMode = .onTap
        self.phoneCodeDropDown.delegate = presenter
        
        let datasource = ["dwa", "dwa","dwa","dwa","dwa","dwa"]
        self.phoneCodeDropDown.dataSource = datasource
        self.phoneCodeDropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? PhoneNumberPrefixTableViewCell else { return }
            cell.countryFlagImageView.backgroundColor = .red
            cell.countryNameLabel.text = "Crna Gora"
            cell.countryCodeLabel.text = "+382"
        }
        
        self.phoneCodeDropDown.selectionAction = { [weak self] (index, item) in
            guard let self = self else {return}
            self.presenter?.handleDropDownTap()
        }
        
        self.phoneStack = UIStackView(arrangedSubviews: [self.phonePrefixField, self.phoneField])
        self.phoneStack.axis = .horizontal
        self.phoneStack.distribution = .fill
        self.phoneStack.alignment = .fill
        self.phoneStack.spacing = 16
        
        
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        backgroundView.addSubview(shadowPlaceholderView)
        shadowPlaceholderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        backgroundView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(shadowPlaceholderView.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(self.nameField)
        self.nameField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(24)
        }
        
        contentView.addSubview(self.cityField)
        self.cityField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.nameField.snp.bottom).offset(16)
        }
        
        contentView.addSubview(self.phoneStack)
        self.phoneStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(self.cityField.snp.bottom).offset(16)
            make.trailing.equalToSuperview().offset(-20)
        }
        
//        contentView.addSubview(self.phonePrefixField)
//        self.phonePrefixField.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(20)
//            make.top.equalTo(self.cityField.snp.bottom).offset(16)
//            make.width.equalTo(106)
//        }
//        
//        contentView.addSubview(self.phoneField)
//        self.phoneField.snp.makeConstraints { make in
//            make.leading.equalTo(self.phonePrefixField.snp.trailing).offset(16)
//            make.trailing.equalToSuperview().offset(-20)
//            make.top.equalTo(self.cityField.snp.bottom).offset(16)
//        }
        
        contentView.addSubview(self.emailField)
        self.emailField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.phoneStack.snp.bottom).offset(16)
        }
        
        contentView.addSubview(termsStack)
        termsStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.emailField.snp.bottom).offset(32)
        }
        
        contentView.addSubview(sendButton)
        sendButton.snp.makeConstraints { make in
            make.top.equalTo(termsStack.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(48)
            make.bottom.equalToSuperview().offset(-69)
        }
    }
    
    func setupAttributedString() -> NSAttributedString {
        let part1 = "\(LocalizedTitle.iAgreeWith.localized) ".withAttributes([
            .textColor(AppColors.black),
            .font(.inter(ofSize: 16, name: .regular))
        ])
        
        let part2 = "\(LocalizedTitle.termsString.localized) ".withAttributes([
            .textColor(AppColors.link),
            .font(.inter(ofSize: 16, name: .bold)),
        ])
        
        let part3 = LocalizedTitle.thisCard.localized.withAttributes([
            .textColor(AppColors.black),
            .font(.inter(ofSize: 16, name: .regular))
        ])
        
        return part1 + part2 + part3
    }
}
