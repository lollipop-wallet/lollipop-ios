//
//  OTPUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 25.4.24..
//

import UIKit

extension OTPView {
    func setup() {
        OTPWireframe.createModule(OTPRef: self)
        self.view.backgroundColor = AppColors.lightGrey
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 16, name: .regular)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.confirmEmailAdderss.localized
        
        lazy var closeButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.closeIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onCloseTap)
            button.target = self
            return button
        }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 22, name: .bold)
            label.textAlignment = .left
            label.text = LocalizedTitle.activationCodeTitle.localized
            label.textColor = AppColors.black
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        self.navigationItem.leftBarButtonItems = [closeButton]
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
    }
}
