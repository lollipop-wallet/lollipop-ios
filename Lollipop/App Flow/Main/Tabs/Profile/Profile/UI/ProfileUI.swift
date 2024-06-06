//
//  ProfileUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit
import SwiftyAttributes

extension ProfileView {
    func setup() {
        self.view.backgroundColor = AppColors.brandPrimary
        ProfileWireframe.createModule(ProfileRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: AppColors.white, .font : UIFont.inter(ofSize: 20, name: .bold)]
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myProfile.localized
        
        self.avatarImageView.layer.cornerRadius = 38
        self.avatarImageView.layer.masksToBounds = true
        self.avatarImageView.clipsToBounds = true
        self.avatarImageView.contentMode = .scaleAspectFill
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
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(editButton)
            editButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white
            return view
        }()
        
        lazy var editContainerView: UIView = {
            let view = UIView()
            view.addSubview(editIconPlaceholder)
            editIconPlaceholder.snp.makeConstraints { make in
                make.width.height.equalTo(32)
                make.centerX.centerY.equalToSuperview()
            }
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 20
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var avatarContainerView: UIView = {
            let view = UIView()
            view.addSubview(self.avatarImageView)
            self.avatarImageView.snp.makeConstraints { make in
                make.leading.top.bottom.equalToSuperview()
                make.width.equalTo(76)
            }
            view.addSubview(editContainerView)
            editContainerView.snp.makeConstraints { make in
                make.trailing.equalToSuperview()
                make.bottom.equalToSuperview().offset(4)
                make.width.height.equalTo(40)
            }
            view.snp.makeConstraints { make in
                make.width.equalTo(88)
                make.height.equalTo(76)
            }
            return view
        }()
        
        self.nameLabel.font = .inter(ofSize: 18, name: .bold)
        self.nameLabel.textAlignment = .left
        self.nameLabel.textColor = AppColors.white
        self.nameLabel.numberOfLines = 0
        self.nameLabel.lineBreakMode = .byWordWrapping
        
        self.phoneLabel.font = .inter(ofSize: 14, name: .regular)
        self.phoneLabel.textAlignment = .left
        self.phoneLabel.textColor = AppColors.white.withAlphaComponent(0.6)
        
        lazy var avatarTextStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.nameLabel, self.phoneLabel])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 2
            return stack
        }()
        
        lazy var avatarMainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [avatarContainerView, avatarTextStack])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 12
            return stack
        }()
        
        lazy var avatarSectionPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white.withAlphaComponent(0.2)
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.addSubview(avatarMainStack)
            avatarMainStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(12)
                make.trailing.bottom.equalToSuperview().offset(-12)
            }
            return view
        }()
        
        lazy var heartIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.heartIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var arrowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.arrowRightIcon)
            imageView.tintColor = AppColors.white
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var favoriteShopsLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.white
            label.textAlignment = .left
            label.text = LocalizedTitle.myShops.localized
            return label
        }()
        
        lazy var favoriteShopsStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [heartIcon, favoriteShopsLabel, arrowIcon])
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 13
            return stack
        }()
        
        lazy var favoriteButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onFavoriteShopsTap), for: .touchUpInside)
            return button
        }()
        
        lazy var favoriteShopsPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(favoriteShopsStack)
            favoriteShopsStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(16)
                make.bottom.trailing.equalToSuperview().offset(-16)
                
            }
            view.addSubview(favoriteButton)
            favoriteButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white.withAlphaComponent(0.2)
            return view
        }()
        
        self.tableView.separatorStyle = .singleLine
        self.tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: CellId.profileCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.sectionHeaderTopPadding = .zero
        self.tableView.sectionFooterHeight = 0
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.separatorInset = .zero
        self.tableView.separatorColor = AppColors.black.withAlphaComponent(0.2)
        tableView.tableFooterView = UIView(frame: CGRect(x: CGFloat.leastNonzeroMagnitude, y: CGFloat.leastNonzeroMagnitude, width: tableView.bounds.size.width, height: CGFloat.leastNonzeroMagnitude))

        lazy var tableViewPlaceholder: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            view.addSubview(self.tableView)
            self.tableView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalToSuperview().offset(24)
            }
            
            view.addSubview(infoStack)
            infoStack.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.equalTo(self.tableView.snp.bottom).offset(48)
                make.bottom.equalToSuperview().offset(-48)
            }
            
            
            view.layer.cornerRadius = 32
            view.layer.masksToBounds = true
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            return view
        }()
        
        self.versionLabel.font = .inter(ofSize: 12, name: .regular)
        self.versionLabel.textColor = AppColors.darkGrey
        self.versionLabel.text =  "\(LocalizedTitle.version.localized): \(UIApplication.appVersion)"
        self.versionLabel.textAlignment = .center
        
        lazy var termsButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onTermsTap), for: .touchUpInside)
            button.setAttributedTitle(self.prepareAttributedTitleWith(title: LocalizedTitle.termsAndConditions.localized), for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(15)
            }
            button.titleLabel?.textAlignment = .right
            return button
        }()
        
        lazy var privacyButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onPrivacyTap), for: .touchUpInside)
            button.setAttributedTitle(self.prepareAttributedTitleWith(title: LocalizedTitle.privacyPolicy.localized), for: .normal)
            button.snp.makeConstraints { make in
                make.height.equalTo(15)
            }
            button.titleLabel?.textAlignment = .left
            return button
        }()
        
        lazy var linksStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [privacyButton, termsButton])
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 32
            return stack
        }()
        
        lazy var infoStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.versionLabel, linksStack])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 10
            return stack
        }()
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        lazy var bottomView : UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(avatarSectionPlaceholderView)
        avatarSectionPlaceholderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(100)
        }
        
        contentView.addSubview(tableViewPlaceholder)
        tableViewPlaceholder.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(avatarSectionPlaceholderView.snp.bottom).offset(32)
        }
        
        contentView.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(tableViewPlaceholder.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(100)
        }
        
    }
    
    func prepareAttributedTitleWith(title: String) -> NSAttributedString{
        return title.withAttributes([
            .textColor(AppColors.black),
            .font(.inter(ofSize: 12, name: .regular)),
            .underlineStyle(.single),
            .underlineColor(AppColors.black)
        ])
    }
}
