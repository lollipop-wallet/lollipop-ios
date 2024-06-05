//
//  HTMLUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 5.6.24..
//

import UIKit

extension HTMLView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        HTMLWireframe.createModule(HTMLRef: self)
        
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
        self.webView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 40)
        }
        
        lazy var seeMoreButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onSeeMoreTap), for: .touchUpInside)
            //button.setTitle(LocalizedTitle.seeMore.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 16, name: .medium)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        self.seeMoreButton = seeMoreButton
        
        lazy var seeMorePlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(self.seeMoreButton)
            self.seeMoreButton.snp.makeConstraints { make in
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
        
        self.seeMoreView = seeMorePlaceholderView
        self.seeMoreView.snp.makeConstraints { make in
            make.height.equalTo(96)
            make.width.equalTo(self.view.frame.width)
        }
        
        lazy var mainStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.webView, self.seeMoreView])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 0
            return stack
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

//        self.view.addSubview(self.webView)
//        self.webView.snp.makeConstraints { make in
//            make.top.equalTo(self.titleLabel.snp.bottom).offset(32)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview().offset(-120)
//        }
        
        self.view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(32)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
