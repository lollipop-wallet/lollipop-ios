//
//  NewLoyaltyCardUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

extension NewLoyaltyCardView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        NewLoyaltyCardWireframe.createModule(NewLoyaltyCardRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        appearance.backgroundColor = AppColors.white
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
                
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        
        self.cardImageFrontSideView.contentMode = .scaleAspectFill
        self.cardImageFrontSideView.layer.cornerRadius = 8
        self.cardImageFrontSideView.layer.borderWidth = 1
        self.cardImageFrontSideView.layer.borderColor = AppColors.brandPrimary.cgColor
        self.cardImageFrontSideView.clipsToBounds = true
        self.cardImageFrontSideView.image = UIImage(named: AssetTitles.cardTemplateFrontIcon)
        
        lazy var frontLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 10, name: .medium)
            label.textAlignment = .left
            label.textColor = AppColors.darkGrey
            label.text = LocalizedTitle.frontSide.localized
            label.snp.makeConstraints { make in
                make.height.equalTo(16)
            }
            return label
        }()
        
        lazy var frontStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardImageFrontSideView, frontLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var frontCameraIcon: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: AssetTitles.cameraIcon)
            return image
        }()
        
        lazy var frontCameraButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onFrontCameraTap), for: .touchUpInside)
            return button
        }()
        
        lazy var frontCameraYellowView: UIView = {
            let view = UIView()
            view.addSubview(frontCameraIcon)
            frontCameraIcon.snp.makeConstraints { make in
                make.width.height.equalTo(24)
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(frontCameraButton)
            frontCameraButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.yellow
            view.layer.cornerRadius = 24
            view.layer.masksToBounds = true
            return view
        }()
        
        self.frontCardCameraViewPlaceholder.layer.cornerRadius = 28
        self.frontCardCameraViewPlaceholder.layer.masksToBounds = true
        self.frontCardCameraViewPlaceholder.backgroundColor = AppColors.white
        self.frontCardCameraViewPlaceholder.addSubview(frontCameraYellowView)
        frontCameraYellowView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(4)
            make.trailing.bottom.equalToSuperview().offset(-4)
        }
        
        lazy var frontPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(frontStack)
            frontStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview()
                make.bottom.equalToSuperview().offset(-4)
                make.trailing.equalToSuperview().offset(-8)
            }
            view.addSubview(self.frontCardCameraViewPlaceholder)
            self.frontCardCameraViewPlaceholder.snp.makeConstraints { make in
                make.trailing.bottom.equalToSuperview()
                make.width.height.equalTo(56)
            }
            return view
        }()
        
        self.cardImageBackSideView.contentMode = .scaleAspectFill
        self.cardImageBackSideView.layer.cornerRadius = 8
        self.cardImageBackSideView.layer.borderWidth = 1
        self.cardImageBackSideView.layer.borderColor = AppColors.brandPrimary.cgColor
        self.cardImageBackSideView.clipsToBounds = true
        self.cardImageBackSideView.image = UIImage(named: AssetTitles.cardTemplateBackIcon)

        lazy var backLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 10, name: .medium)
            label.textAlignment = .left
            label.textColor = AppColors.darkGrey
            label.text = LocalizedTitle.backSide.localized
            label.snp.makeConstraints { make in
                make.height.equalTo(16)
            }
            return label
        }()
        
        lazy var backStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardImageBackSideView, backLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 4
            return stack
        }()
        
        lazy var backCameraIcon: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: AssetTitles.cameraIcon)
            return image
        }()
        
        lazy var backCameraButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onBackCameraTap), for: .touchUpInside)
            return button
        }()
        
        lazy var backCameraYellowView: UIView = {
            let view = UIView()
            view.addSubview(backCameraIcon)
            backCameraIcon.snp.makeConstraints { make in
                make.width.height.equalTo(24)
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(backCameraButton)
            backCameraButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.yellow
            view.layer.cornerRadius = 24
            view.layer.masksToBounds = true
            return view
        }()
        
        self.backCardCameraViewPlaceholder.layer.cornerRadius = 28
        self.backCardCameraViewPlaceholder.layer.masksToBounds = true
        self.backCardCameraViewPlaceholder.backgroundColor = AppColors.white
        self.backCardCameraViewPlaceholder.addSubview(backCameraYellowView)
        backCameraYellowView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(4)
            make.trailing.bottom.equalToSuperview().offset(-4)
        }
        
        lazy var backPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(backStack)
            backStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview()
                make.bottom.equalToSuperview().offset(-4)
                make.trailing.equalToSuperview().offset(-8)
            }
            view.addSubview(self.backCardCameraViewPlaceholder)
            self.backCardCameraViewPlaceholder.snp.makeConstraints { make in
                make.trailing.bottom.equalToSuperview()
                make.width.height.equalTo(56)
            }
            return view
        }()
        
        self.cardImageView.contentMode = .scaleAspectFill
        self.cardImageView.layer.cornerRadius = 8
        self.cardImageView.layer.borderWidth = 1
        self.cardImageView.layer.borderColor = AppColors.brandPrimary.cgColor
        self.cardImageView.snp.makeConstraints { make in
            make.width.equalTo(198)
            make.height.equalTo(128)
        }
        self.cardImageView.backgroundColor = .red
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [frontPlaceholderView, backPlaceholderView])
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.spacing = 16
            return stack
        }()
        
        
        lazy var dataPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(mainStack)
            mainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-12)
                make.bottom.equalToSuperview().offset(-32)
                make.top.equalToSuperview().offset(24)
                make.height.equalTo(((self.view.frame.width - 40)) * 0.36)
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
        
        lazy var shaddowPlaceholderView: UIView = {
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
        
        lazy var saveButton: UIButton = {
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
        
        self.cardNameField.title = "\(LocalizedTitle.cardTitle.localized):"
        self.cardNameField.errorHidden = true
        self.cardNameField.keyboardType = .default
        self.cardNameField.background = AppColors.white
        self.cardNameField.leftSuplementaryIconHidden = true
        
        self.cardNumberField.title = "\(LocalizedTitle.cardNumber.localized) (\(LocalizedTitle.optional.localized)):"
        self.cardNumberField.errorHidden = true
        self.cardNumberField.keyboardType = .default
        self.cardNumberField.background = AppColors.white
        self.cardNumberField.leftSuplementaryIconHidden = true
        
        self.nameOnTheCardField.title = "\(LocalizedTitle.nameOnTheCard.localized) (\(LocalizedTitle.optional.localized)):"
        self.nameOnTheCardField.errorHidden = true
        self.nameOnTheCardField.keyboardType = .default
        self.nameOnTheCardField.background = AppColors.white
        self.nameOnTheCardField.leftSuplementaryIconHidden = true
        
        self.cardBarcodeField.title = "\(LocalizedTitle.barcode.localized):"
        self.cardBarcodeField.errorHidden = true
        self.cardBarcodeField.keyboardType = .default
        self.cardBarcodeField.background = AppColors.white
        self.cardBarcodeField.leftSuplementaryIconHidden = false
        self.cardBarcodeField.leftSuplementaryIcon = UIImage(named: AssetTitles.inputFieldBarcodeIcon)
        self.cardBarcodeField.leftSuplementaryIconTint = AppColors.brandPrimary
        
        self.cardNotesField.title = "\(LocalizedTitle.notes.localized) (\(LocalizedTitle.optional.localized)):"
        self.cardNotesField.placeholder = "\(LocalizedTitle.max300Chars.localized)"
        self.cardNotesField.errorHidden = true
        self.cardNotesField.leftSuplementaryIconHidden = true
        self.cardNotesField.background = AppColors.white
        
        lazy var fieldsStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardNameField, self.cardNumberField, self.nameOnTheCardField, self.cardBarcodeField, self.cardNotesField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
//        backgroundView.addSubview(shaddowPlaceholderView)
//        shaddowPlaceholderView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//        }
        
        backgroundView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
            //make.top.equalTo(shaddowPlaceholderView.snp.bottom)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(shaddowPlaceholderView)
        shaddowPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
        
        contentView.addSubview(fieldsStack)
        fieldsStack.snp.makeConstraints { make in
            make.top.equalTo(shaddowPlaceholderView.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-44)
            make.top.equalTo(fieldsStack.snp.bottom).offset(32)
            make.height.equalTo(48)
        }
    }
}
