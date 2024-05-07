//
//  ScannerUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

extension ScannerView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ScannerWireframe.createModule(ScannerRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        navigationItem.title = LocalizedTitle.scan.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.scanBarcodeFromCard.localized
            return label
        }()
        
        lazy var scannerPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.black
            view.layer.cornerRadius = 24
            view.layer.masksToBounds = true
            return view
        }()
        
        self.scannerContainerView.layer.borderWidth = 2
        self.scannerContainerView.layer.borderColor = AppColors.white.cgColor
        self.scannerContainerView.layer.cornerRadius = 16
        self.scannerContainerView.layer.masksToBounds = true
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(48)
        }
        
        self.view.addSubview(scannerPlaceholderView)
        scannerPlaceholderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
            make.height.equalTo((self.view.frame.width - 40) * 1.27)
        }
        
        scannerPlaceholderView.addSubview(self.scannerContainerView)
        self.scannerContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-72)
            make.height.equalTo(self.scannerContainerView.snp.width).multipliedBy(0.62)
        }
        self.addChild(scannerViewController)
        scannerViewController.view.frame = scannerContainerView.bounds
        scannerContainerView.addSubview(scannerViewController.view)
        scannerViewController.didMove(toParent: self)
        scannerViewController.messageViewController.view.isHidden = true
        scannerViewController.messageViewController.imageView.isHidden = true
        scannerViewController.messageViewController.borderView.isHidden = true

//        scannerViewController.headerViewController.titleLabel.text = "Skeniranje"
//        scannerViewController.headerViewController.closeButton.setTitle("Odustani", for: .normal)
        
//        self.view.addSubview(self.scannerContainerView)
//        self.scannerContainerView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.centerX.centerY.equalToSuperview()
//            make.height.equalTo(400)
//        }
    }
}
