//
//  NewPartnerUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29.4.24..
//

import UIKit

extension NewPartnerView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        NewPartnerWireframe.createModule(NewPartnerRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.partnerDetails.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var lollipopPartnerIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.partnerDetailsArtworkIcon)
            return imageView
        }()
        
        self.shopNameField.title = "\(LocalizedTitle.shopName.localized):"
        self.shopNameField.placeholder = "\(LocalizedTitle.enterShopMerchantName.localized):"
        self.shopNameField.errorHidden = true
        self.shopNameField.keyboardType = .default
        self.shopNameField.background = AppColors.white
        self.shopNameField.leftSuplementaryIconHidden = true
        
        self.cityField.title = "\(LocalizedTitle.city.localized) (\(LocalizedTitle.optional.localized)):"
        self.cityField.errorHidden = true
        self.cityField.background = AppColors.white
        self.cityField.text = LocalizedTitle.choose.localized
        self.cityField.rightSuplementaryIconHidden = false
        //self.cityField.delegate = presenter
        
        self.addressField.title = "\(LocalizedTitle.address.localized) (\(LocalizedTitle.optional.localized)):"
        self.addressField.placeholder = "\(LocalizedTitle.enterAddress.localized)"
        self.addressField.errorHidden = true
        self.addressField.keyboardType = .default
        self.addressField.background = AppColors.white
        self.addressField.leftSuplementaryIconHidden = false
        self.addressField.leftSuplementaryIcon = UIImage(named: AssetTitles.locationPitIcon)
        
        self.noteField.title = "\(LocalizedTitle.additionalNote.localized) (\(LocalizedTitle.optional.localized)):"
        self.noteField.placeholder = "\(LocalizedTitle.max300Chars.localized)"
        self.noteField.errorHidden = true
        self.noteField.leftSuplementaryIconHidden = true
        self.noteField.background = AppColors.white
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.shopNameField, self.cityField, self.addressField, self.noteField])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        self.view.addSubview(lollipopPartnerIcon)
        lollipopPartnerIcon.snp.makeConstraints { make in
            make.width.height.equalTo(128)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
        }
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(lollipopPartnerIcon.snp.bottom).offset(24)
        }
    }
}
