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
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [addCardButton]
        
        lazy var mainContentView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPrimary
            return view
        }()
        
        lazy var curvedTopView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 24
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        
        self.cardView.delegate = presenter
        
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
        
        self.allCardsButton.addTarget(self, action: #selector(onSeeAllCardsTap), for: .touchUpInside)
        self.allCardsButton.setTitle(LocalizedTitle.seeAllCards.localized, for: .normal)
        self.allCardsButton.backgroundColor = AppColors.white
        self.allCardsButton.titleLabel?.font = .inter(ofSize: 14, name: .semibold)
        self.allCardsButton.setTitleColor(AppColors.brandPrimary, for: .normal)
        self.allCardsButton.layer.cornerRadius = 12
        self.allCardsButton.layer.masksToBounds = true
        
        mainContentView.addSubview(self.cardView)
        self.cardView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(30)
        }
        
        mainContentView.addSubview(self.allCardsButton)
        self.allCardsButton.snp.makeConstraints { make in
            make.top.equalTo(self.cardView.snp.bottom).offset(48)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(170)
        }
    }
}
