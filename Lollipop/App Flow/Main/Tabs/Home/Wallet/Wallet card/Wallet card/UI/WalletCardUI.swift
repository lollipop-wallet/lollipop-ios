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
        
        lazy var detailsButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.title = LocalizedTitle.details.localized
            button.tintColor = AppColors.link
            button.setTitleTextAttributes([ NSAttributedString.Key.font: UIFont.inter(ofSize: 16, name: .semibold)], for: UIControl.State.normal)
            button.action = #selector(self.onDetailsTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [detailsButton]
        
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
        self.barcodeImageView.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        self.barcodeNumberLabel.font = .inter(ofSize: 18, name: .regular)
        self.barcodeNumberLabel.textAlignment = .center
        self.barcodeNumberLabel.textColor = AppColors.black
        self.barcodeNumberLabel.text = "231532321315123"
        self.barcodeNumberLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        self.plainNumberLabel.font = .inter(ofSize: 18, name: .regular)
        self.plainNumberLabel.textAlignment = .center
        self.plainNumberLabel.textColor = AppColors.black
        self.plainNumberLabel.snp.makeConstraints { make in
            make.height.equalTo(22)
        }
        
        self.qrCodeImageView.contentMode = .scaleAspectFit
        self.qrCodeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(101)
        }
        
        self.barcodeStackView = UIStackView(arrangedSubviews: [self.barcodeImageView, self.barcodeNumberLabel, self.plainNumberLabel, self.qrCodeImageView])
        self.barcodeStackView.axis = .vertical
        self.barcodeStackView.distribution = .fill
        self.barcodeStackView.alignment = .fill
        self.barcodeStackView.spacing = 7
//        self.barcodeStackView.snp.makeConstraints { make in
//            make.width.equalTo(self.view.frame.width - 66)
//        }
        
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
        
        self.aboutTitleLabel = aboutTitleLabel
        
        lazy var aboutButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAboutProgrammeTap), for: .touchUpInside)
            return button
        }()
        
        lazy var aboutStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [aboutIcon, self.aboutTitleLabel])
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
        
        self.rulesTitleLabel = rulesTitleLabel
        
        lazy var rulesButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onRulesTap), for: .touchUpInside)
            return button
        }()
        
        lazy var rulesStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [rulesIcon, self.rulesTitleLabel])
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
        
        self.tableView.separatorStyle = .none
        self.tableView.register(WalletCardShopTableViewCell.self, forCellReuseIdentifier: CellId.walletCardShopCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        
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
        
        
        contentView.addSubview(self.barcodeStackView)
        self.barcodeStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
//        contentView.addSubview(self.barcodeNumberLabel)
//        self.barcodeNumberLabel.snp.makeConstraints { make in
//            make.top.equalTo(self.barcodeImageView.snp.bottom).offset(7)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//        }
        
        contentView.addSubview(self.loyaltyCard)
        self.loyaltyCard.snp.makeConstraints { make in
            make.top.equalTo(self.barcodeStackView.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
        }
        
        contentView.addSubview(mainInfoStack)
        mainInfoStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.loyaltyCard.snp.bottom).offset(32)
            make.height.equalTo((self.view.frame.width - 40) * 0.23)
        }
        
        contentView.addSubview(saleSpotsLabel)
        saleSpotsLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(28)
            make.trailing.equalToSuperview().offset(-28)
            make.top.equalTo(mainInfoStack.snp.bottom).offset(28)
        }
        
        contentView.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(saleSpotsLabel.snp.bottom).offset(16)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
