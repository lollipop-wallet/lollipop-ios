//
//  AccountDeletionUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 28/04/2024.
//

import UIKit

extension AccountDeletionView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        AccountDeletionWireframe.createModule(AccountDeletionRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.accountDeletion.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var warningIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.deleteAccountWarningIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(96)
            }
            return imageView
        }()
        
        lazy var warningTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 24, name: .bold)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.deleteAccountTitle.localized
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        lazy var warningSubtitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.deleteAccountSubtitle.localized
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            return label
        }()
        
        lazy var textStack : UIStackView = {
            let stack = UIStackView(arrangedSubviews: [warningTitleLabel, warningSubtitleLabel])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var infoStackView : UIStackView = {
            let stack = UIStackView(arrangedSubviews: [warningIcon, textStack])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 32
            return stack
        }()
        
        self.view.addSubview(infoStackView)
        infoStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
