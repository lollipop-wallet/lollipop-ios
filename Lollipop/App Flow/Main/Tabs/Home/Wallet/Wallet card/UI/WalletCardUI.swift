//
//  WalletCardUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 4.5.24..
//

import UIKit

extension WalletCardView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        WalletCardWireframe.createModule(WalletCardRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myCards.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var mainContentView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        lazy var curvedTopView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 24
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        lazy var mainContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = .clear
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
        
        self.barcodeImageView.contentMode = .scaleAspectFit
        self.barcodeImageView.backgroundColor = .red
        
        self.barcodeNumberLabel.font = .inter(ofSize: 18, name: .regular)
        self.barcodeNumberLabel.textAlignment = .center
        self.barcodeNumberLabel.textColor = AppColors.black
        self.barcodeNumberLabel.text = "231532321315123"
        
        self.loyaltyCard.pointsHidden = true
        
        ///Locations
        lazy var locationsIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.locationPitIcon)
            imageView.tintColor = AppColors.brandPrimary
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var locationsTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 12, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.locations.localized
            return label
        }()
        
        lazy var locationsButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onLocationsTap), for: .touchUpInside)
            return button
        }()
        
        lazy var locationsStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [locationsIcon, locationsTitleLabel])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 10
            return stack
        }()
        
        lazy var locationsPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.addSubview(locationsStack)
            locationsStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(locationsButton)
            locationsButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            return view
        }()
        
        ///About
        lazy var aboutIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.infoIcon)
            imageView.tintColor = AppColors.brandPrimary
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var aboutTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 12, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.aboutProgramme.localized
            return label
        }()
        
        lazy var aboutButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAboutProgrammeTap), for: .touchUpInside)
            return button
        }()
        
        lazy var aboutStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [aboutIcon, aboutTitleLabel])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 10
            return stack
        }()
        
        lazy var aboutPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.addSubview(aboutStack)
            aboutStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(aboutButton)
            aboutButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            return view
        }()
        
        
        ///Rules
        lazy var rulesIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.termsIcon)
            imageView.tintColor = AppColors.brandPrimary
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var rulesTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 12, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.rules.localized
            return label
        }()
        
        lazy var rulesButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onRulesTap), for: .touchUpInside)
            return button
        }()
        
        lazy var rulesStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [rulesIcon, rulesTitleLabel])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 10
            return stack
        }()
        
        lazy var rulesPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.addSubview(rulesStack)
            rulesStack.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(rulesButton)
            rulesButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var mainInfoStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [locationsPlaceholderView, aboutPlaceholderView, rulesPlaceholderView])
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fillEqually
            stack.spacing = 16
            return stack
        }()
        
        lazy var saleSpotsLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 20, name: .bold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = LocalizedTitle.saleSpots.localized
            return label
        }()
        
        view.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        mainContentView.addSubview(curvedTopView)
        curvedTopView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height * 0.33)
        }
        
        mainContentView.addSubview(mainContainerView)
        mainContainerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        mainContentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(self.barcodeImageView)
        self.barcodeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(80)
        }
        
        contentView.addSubview(self.barcodeNumberLabel)
        self.barcodeNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(self.barcodeImageView.snp.bottom).offset(7)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        contentView.addSubview(self.loyaltyCard)
        self.loyaltyCard.snp.makeConstraints { make in
            make.top.equalTo(self.barcodeNumberLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(mainInfoStack)
        mainInfoStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.loyaltyCard.snp.bottom).offset(32)
            make.height.equalTo(80)
        }
        
        contentView.addSubview(saleSpotsLabel)
        saleSpotsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-28)
            make.top.equalTo(mainInfoStack.snp.bottom).offset(28)
        }
    }
}
