//
//  HomeUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension HomeView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        HomeWireframe.createModule(HomeRef: self)
        
        
        ///Navigator
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
                make.leading.trailing.top.equalToSuperview()
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
            view.backgroundColor = AppColors.brandPrimary
            view.layer.cornerRadius = 20
            view.layer.masksToBounds = true
            return view
        }()
        
        lazy var addPlaceholder: UIView = {
            let view = UIView()
            view.addSubview(addButtonPlaceholder)
            addButtonPlaceholder.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.bottom.equalToSuperview().offset(5)
                make.width.height.equalTo(40)
            }
            view.addSubview(rightBarButton)
            rightBarButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.snp.makeConstraints { make in
                make.width.height.equalTo(48)
            }
            return view
        }()
        
        lazy var addButton: UIBarButtonItem = {
            let barButton = UIBarButtonItem(customView: addPlaceholder)
            return barButton
        }()
        
        self.navigationItem.leftBarButtonItems = [avatarButton]
        self.navigationItem.rightBarButtonItems = [addButton]
        
        ///Content
        
        lazy var mainContentView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.cardStackView.axis = .vertical
        self.cardStackView.distribution = .fill
        self.cardStackView.alignment = .fill
        
        self.view.addSubview(mainContentView)
        mainContentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
        
        mainContentView.addSubview(self.cardStackView)
        self.cardStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
}
