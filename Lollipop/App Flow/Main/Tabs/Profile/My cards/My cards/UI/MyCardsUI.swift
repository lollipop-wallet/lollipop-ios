//
//  MyCardsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 28/04/2024.
//

import UIKit

extension MyCardsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        MyCardsWireframe.createModule(MyCardsRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.myCards.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        lazy var sortButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.title = LocalizedTitle.sort.localized
            button.tintColor = AppColors.link
            button.action = #selector(self.onSortTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [sortButton]
        
        self.tableView.separatorStyle = .none
        self.tableView.register(MyCardsTableViewCell.self, forCellReuseIdentifier: CellId.myCardsCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.sectionHeaderTopPadding = 0
        
        lazy var addIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.plusIcon)
            imageView.tintColor = AppColors.white
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var addLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .semibold)
            label.textColor = AppColors.white
            label.textAlignment = .center
            label.text = LocalizedTitle.addCard.localized
            return label
        }()
        
        lazy var addCardStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [addIcon, addLabel])
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 8
            return stack
        }()
        
        lazy var newCardButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onNewCardTap), for: .touchUpInside)
            return button
        }()
        
        lazy var addCardPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPrimary
            view.addSubview(addCardStack)
            addCardStack.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().offset(-10)
                make.centerX.centerY.equalToSuperview()
            }
            view.addSubview(newCardButton)
            newCardButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 12
            view.layer.masksToBounds = true
            return view
        }()

        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
        
        self.view.addSubview(addCardPlaceholderView)
        addCardPlaceholderView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
    }
}
