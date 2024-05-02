//
//  HomeUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension HomeView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        HomeWireframe.createModule(HomeRef: self)
        
        self.avatarImageView.contentMode = .scaleAspectFill
        self.avatarImageView.image = UIImage(named: AssetTitles.avatarIcon)
        self.avatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(48)
        }
        self.avatarLabel.textAlignment = .left
        self.avatarLabel.textColor = AppColors.black
        self.avatarLabel.text = "Prijavi se"
        
        lazy var avatarStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.avatarImageView, self.avatarLabel])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 16
            return stack
        }()
        
        lazy var leftBarButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAvatarTap), for: .touchUpInside)
            return button
        }()
        
        lazy var avatarPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(avatarStack)
            avatarStack.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.addSubview(leftBarButton)
            leftBarButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            return view
        }()
        
        lazy var avatarButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem(customView: avatarPlaceholder)
            return barButton
        }()
        
        
        lazy var addIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.plusIcon)
            imageView.tintColor = AppColors.white
            return imageView
        }()
        
        lazy var rightBarButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onPlusTap), for: .touchUpInside)
            return button
        }()
        
        lazy var addButtonPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(addIcon)
            addIcon.snp.makeConstraints { make in
                make.width.height.equalTo(24)
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(rightBarButton)
            rightBarButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 20
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
            return view
        }()
        
        lazy var addButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem(customView: addButtonPlaceholder)
            return barButton
        }()
        
        
        self.navigationItem.leftBarButtonItems = [avatarButton]
        self.navigationItem.rightBarButtonItems = [addButton]
    }
}
