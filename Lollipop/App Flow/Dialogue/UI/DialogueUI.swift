//
//  DialogueUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29.4.24..
//

import UIKit

extension DialogueView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        DialogueWireframe.createModule(DialogueRef: self)
        
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
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.iconView.contentMode = .scaleAspectFit
        self.iconView.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width - 96)
        }
        
        self.titleLabel.font = .inter(ofSize: 24, name: .bold)
        self.titleLabel.textAlignment = .center
        self.titleLabel.textColor = AppColors.black
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode = .byWordWrapping
        
        self.subtitleLabel.font = .inter(ofSize: 16, name: .regular)
        self.subtitleLabel.textAlignment = .center
        self.subtitleLabel.textColor = AppColors.black
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.lineBreakMode = .byWordWrapping
        
        lazy var textStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.titleLabel, self.subtitleLabel])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.iconView, textStack])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 32
            return stack
        }()
        
        self.actionButton.addTarget(self, action: #selector(onActionTap), for: .touchUpInside)
        self.actionButton.backgroundColor = AppColors.brandPrimary
        self.actionButton.titleLabel?.font = .inter(ofSize: 16, name: .medium)
        self.actionButton.setTitleColor(AppColors.white, for: .normal)
        self.actionButton.layer.cornerRadius = 12
        self.actionButton.layer.masksToBounds = true
        
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.centerX.centerY.equalToSuperview()
        }
        
        self.view.addSubview(self.actionButton)
        self.actionButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-53)
            make.height.equalTo(48)
        }
    }
}
