//
//  PromotionDetailsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

extension PromotionDetailsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PromotionDetailsWireframe.createModule(PromotionDetailsRef: self)
        
        let standardAppearance = UINavigationBarAppearance()

        standardAppearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        standardAppearance.backgroundColor = AppColors.lightGrey
        
        navigationItem.standardAppearance = standardAppearance
        
        lazy var backButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: AssetTitles.backIcon), for: .normal)
            button.tintColor = AppColors.black
            button.addTarget(self, action: #selector(onBackTap), for: .touchUpInside)
            return button
        }()
        
        self.titleLabel.font = .inter(ofSize: 30, name: .bold)
        self.titleLabel.textColor = AppColors.black
        self.titleLabel.textAlignment = .left
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode = .byWordWrapping
        
        
        self.webView.isOpaque = false
        self.webView.backgroundColor = UIColor.clear
        self.webView.scrollView.backgroundColor = UIColor.clear
        self.webView.navigationDelegate = presenter
        
        lazy var seeMoreButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onSeeMoreTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.seeMore.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        lazy var seeMorePlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(seeMoreButton)
            seeMoreButton.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(64)
                make.trailing.equalToSuperview().offset(-64)
                make.centerX.centerY.equalToSuperview()
                make.height.equalTo(48)
            }
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            return view
        }()
        
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(68)
        }
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(backButton.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-120)
        }
        
        self.view.addSubview(seeMorePlaceholderView)
        seeMorePlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(96)
        }
    }
}
