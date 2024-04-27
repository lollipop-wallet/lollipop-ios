//
//  ProfileUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension ProfileView {
    func setup() {
        self.view.backgroundColor = AppColors.brandPrimary
        ProfileWireframe.createModule(ProfileRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: AppColors.white, .font : UIFont.inter(ofSize: 20, name: .bold)]
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myProfile.localized
        
        self.avatarImageView.layer.cornerRadius = 52
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.image = UIImage(named: AssetTitles.avatarIcon)
        
        lazy var editIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.editIcon)
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
        
        lazy var editButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onEditAvatarTap), for: .touchUpInside)
            return button
        }()
        
        lazy var editIconPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(editIcon)
            editIcon.snp.makeConstraints { make in
                make.width.height.equalTo(16)
                make.leading.top.equalToSuperview().offset(8)
                make.trailing.bottom.equalToSuperview().offset(-8)
            }
            view.addSubview(editButton)
            editButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 14
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white
            return view
        }()
        
        lazy var editContainerView: UIView = {
            let view = UIView()
            view.addSubview(editIconPlaceholder)
            editIconPlaceholder.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(4)
                make.trailing.bottom.equalToSuperview().offset(-4)
            }
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 18
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var avatarContainerView: UIView = {
            let view = UIView()
            view.addSubview(self.avatarImageView)
            self.avatarImageView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.addSubview(editContainerView)
            editContainerView.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(4)
                make.width.height.equalTo(36)
            }
            return view
        }()
        
        self.nameLabel.font = .inter(ofSize: 24, name: .bold)
        self.nameLabel.textAlignment = .center
        self.nameLabel.textColor = AppColors.white
        self.nameLabel.text = "Aco Draskovic"
        
        self.phoneLabel.font = .inter(ofSize: 14, name: .regular)
        self.phoneLabel.textAlignment = .center
        self.phoneLabel.textColor = AppColors.white.withAlphaComponent(0.6)
        self.phoneLabel.text = "+382 67 231 868"
        
        self.view.addSubview(avatarContainerView)
        avatarContainerView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(104)
        }
        
        self.view.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(avatarContainerView.snp.bottom).offset(12)
        }
        
        self.view.addSubview(self.phoneLabel)
        self.phoneLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(2)
        }
    }
}
