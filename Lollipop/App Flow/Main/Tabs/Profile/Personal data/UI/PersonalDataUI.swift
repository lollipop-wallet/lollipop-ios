//
//  PersonalDataUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import UIKit

extension PersonalDataView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PersonalDataWireframe.createModule(PersonalDataRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.profileSettings.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.tableView.separatorStyle = .none
        //self.tableView.backgroundColor = AppColors.white
        self.tableView.register(PersonalDataTableViewCell.self, forCellReuseIdentifier: CellId.personalDataCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.layer.cornerRadius = 12
        self.tableView.layer.masksToBounds = true
        
        lazy var trashIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.trashIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var arrowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.arrowRightIcon)
            imageView.tintColor = AppColors.black
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var deleteAccountLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .semibold)
            label.textColor = AppColors.error
            label.textAlignment = .left
            label.text = LocalizedTitle.accountDeletion.localized
            return label
        }()
        
        lazy var deleteAccountStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [trashIcon, deleteAccountLabel, arrowIcon])
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 13
            return stack
        }()
        
        lazy var deleteAccountButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onDeleteAccountTap), for: .touchUpInside)
            return button
        }()
        
        lazy var deleteAccountView: UIView = {
            let view = UIView()
            view.addSubview(deleteAccountStack)
            deleteAccountStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(16)
                make.bottom.trailing.equalToSuperview().offset(-16)
                
            }
            view.addSubview(deleteAccountButton)
            deleteAccountButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white
            view.snp.makeConstraints { make in
                make.height.equalTo(56)
            }
            return view
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.tableView, deleteAccountView])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 16
            return stack
        }()
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
        }
    }
}
