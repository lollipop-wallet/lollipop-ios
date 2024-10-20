//
//  WalletUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 4.5.24..
//

import UIKit

extension WalletView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        WalletWireframe.createModule(WalletRef: self)
        
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
        
        lazy var addCardButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.addCardWalletIcon)?.withRenderingMode(.alwaysOriginal)
            button.action = #selector(self.onAddCardTap)
            button.target = self
            return button
        }()
        
        self.addCardBarButton = addCardButton
        
        //self.navigationItem.leftBarButtonItems = [backButton]
        //self.navigationItem.rightBarButtonItems = [addCardButton]
        
        lazy var mainContentView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandSecondary
            return view
        }()
        
        lazy var brandPrimaryBackgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 30, name: .bold)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.placeForYourCards.localized
            return label
        }()
        
        lazy var subtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = LocalizedTitle.keepYourCardsInPhone.localized
            return label
        }()
        
        lazy var textStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 6
            return stack
        }()
        
        lazy var addButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAddCardTap), for: .touchUpInside)
            button.setTitle(LocalizedTitle.addCard.localized, for: .normal)
            button.backgroundColor = AppColors.brandPrimary
            button.titleLabel?.font = .inter(ofSize: 14, name: .semibold)
            button.setTitleColor(AppColors.white, for: .normal)
            button.layer.cornerRadius = 12
            button.layer.masksToBounds = true
            return button
        }()
        
        lazy var backgroudImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.cardsPlaceholderIcon)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        
        lazy var dataContentView: UIView = {
            let view = UIView()
            view.addSubview(backgroudImage)
            backgroudImage.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            
            view.addSubview(textStack)
            textStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.top.equalToSuperview().offset(16)
            }
            
            view.addSubview(addButton)
            addButton.snp.makeConstraints { make in
                make.width.equalTo(123)
                make.height.equalTo(40)
                make.leading.equalToSuperview().offset(20)
                make.top.equalTo(textStack.snp.bottom).offset(24)
            }
            
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.brandPrimary
            return view
        }()
        
        lazy var noCardsContainerView: UIView = {
            let view = UIView()
            
            view.addSubview(brandPrimaryBackgroundView)
            brandPrimaryBackgroundView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(12)
                make.trailing.equalToSuperview().offset(-12)
                make.top.equalToSuperview()
                make.bottom.equalToSuperview().offset(-47)
            }
            
            view.addSubview(dataContentView)
            dataContentView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(15)
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
            
            return view
        }()
        
        self.noCardsView = noCardsContainerView
        
        lazy var curvedTopView: UIView = {
            let view = UIView()
            
            view.addSubview(self.noCardsView)
            self.noCardsView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(20)
                make.bottom.equalToSuperview().offset(-20)
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.height.equalTo(((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 40) * 0.64)
            }
        
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 24
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        self.noCardsView.isHidden = true
        self.cardView.delegate = presenter
        

        
        self.allCardsButton.addTarget(self, action: #selector(onSeeAllCardsTap), for: .touchUpInside)
        self.allCardsButton.setTitle(LocalizedTitle.seeAllCards.localized, for: .normal)
        self.allCardsButton.backgroundColor = AppColors.white
        self.allCardsButton.titleLabel?.font = .inter(ofSize: 14, name: .semibold)
        self.allCardsButton.setTitleColor(AppColors.brandPrimary, for: .normal)
        self.allCardsButton.layer.cornerRadius = 12
        self.allCardsButton.layer.masksToBounds = true
        self.allCardsButton.isHidden = true
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        self.scrollView = scrollView
        
        lazy var logoIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.lollyCircleLogoIcon)
            return imageView
        }()
        
        self.view.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        mainContentView.addSubview(curvedTopView)
        curvedTopView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(self.view.frame.height * 0.33)
        }
        
        mainContentView.addSubview(logoIcon)
        logoIcon.snp.makeConstraints { make in
            make.width.height.equalTo(198)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-87)
        }
        
        mainContentView.addSubview(self.scrollView)
        self.scrollView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(self.scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(self.scrollView)
        }
        
        self.scrollView.addSubview(self.cardView)
        self.cardView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(30)
        }
        
        contentView.addSubview(self.allCardsButton)
        self.allCardsButton.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.bottom).offset(16)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(170)
            make.bottom.equalToSuperview().offset(-48)
        }
    }
}
