//
//  DisplayCardUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 8.5.24..
//

import UIKit

extension DisplayCardView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        DisplayCardWireframe.createModule(DisplayCardRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        
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
            view.backgroundColor = AppColors.brandSecondary
            return view
        }()
        
        lazy var curvedTopView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 24
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            return view
        }()
        

        self.barcodeImageView.contentMode = .scaleAspectFit
        //self.barcodeImageView.backgroundColor = .red
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
        
        self.qrCodeImageView.contentMode = .scaleAspectFit
        self.qrCodeImageView.snp.makeConstraints { make in
            make.width.height.equalTo(101)
        }
        
        self.barcodeStackView = UIStackView(arrangedSubviews: [self.barcodeImageView, self.barcodeNumberLabel, self.qrCodeImageView])
        self.barcodeStackView.axis = .vertical
        self.barcodeStackView.distribution = .fill
        self.barcodeStackView.alignment = .fill
        self.barcodeStackView.spacing = 7
        self.barcodeStackView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 66)
        }
        
        self.cardFrontImageView.layer.cornerRadius = 16
        self.cardFrontImageView.layer.masksToBounds = true
        self.cardFrontImageView.backgroundColor = .red
        self.cardFrontImageView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 66)
            make.height.equalTo((self.view.frame.width - 66) * 0.648)
        }
        
        self.cardBackImageView.layer.cornerRadius = 16
        self.cardBackImageView.layer.masksToBounds = true
        self.cardBackImageView.backgroundColor = .yellow
        self.cardBackImageView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 66)
            make.height.equalTo((self.view.frame.width - 66) * 0.648)
        }
        
        self.cardSerialNumberLabel.font = .inter(ofSize: 24, name: .regular)
        self.cardSerialNumberLabel.textColor = AppColors.black
        self.cardSerialNumberLabel.textAlignment = .center
        self.cardSerialNumberLabel.text = "01JK2-982M-A912-38HA"
        
        lazy var filler: UIView = {
            let view = UIView()
            view.backgroundColor = .red
            return view
        }()
        
        
        lazy var mainStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.barcodeStackView, self.cardSerialNumberLabel, self.cardFrontImageView, self.cardBackImageView, filler])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 40
            return stack
        }()
        
        lazy var curvedPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(curvedTopView)
            curvedTopView.snp.makeConstraints { make in
                make.leading.trailing.top.equalToSuperview()
                make.bottom.equalToSuperview().offset(-105)
            }
            view.addSubview(mainStackView)
            mainStackView.snp.makeConstraints { make in
                make.leading.trailing.bottom.equalToSuperview()
                make.top.equalToSuperview().offset(32)
            }
            return view
        }()
        
        
        view.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        mainContentView.addSubview(curvedPlaceholderView)
        curvedPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
        }
    }
}
