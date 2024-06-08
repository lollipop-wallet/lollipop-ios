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
        appearance.backgroundColor = AppColors.lightGrey
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
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
            button.title = LocalizedTitle.edit.localized
            button.tintColor = AppColors.link
            button.action = #selector(self.onEditTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        self.navigationItem.rightBarButtonItems = [sortButton]
        
        self.segmentedControl = CustomSegmentedControl(items: [LocalizedTitle.allCards.localized, LocalizedTitle.favoriteCards.localized])
        self.segmentedControl.selectedSegmentIndex = 0
        self.segmentedControl.backgroundColor = AppColors.white
        self.segmentedControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        self.segmentedControl.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey, NSAttributedString.Key.font: UIFont.inter(ofSize: 14, name: .semibold)], for: .normal)
        self.segmentedControl.setTitleTextAttributes([.foregroundColor: AppColors.white, NSAttributedString.Key.font:  UIFont.inter(ofSize: 14, name: .semibold)], for: .selected)
        self.segmentedControl.snp.makeConstraints { make in
            make.height.equalTo(47)
        }
        self.segmentedControl.isHidden = true
        
        self.tableView.separatorStyle = .none
        self.tableView.register(MyCardsTableViewCell.self, forCellReuseIdentifier: CellId.myCardsCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.sectionHeaderTopPadding = 0
        
        lazy var mainStackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.segmentedControl, self.tableView])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 24
            return stack
        }()
        
        self.view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalToSuperview()
        }
        
//        self.view.addSubview(segmentedControl)
//        segmentedControl.snp.makeConstraints { make in
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
//            make.height.equalTo(47)
//        }
//
//        self.view.addSubview(self.tableView)
//        self.tableView.snp.makeConstraints { make in
//            make.top.equalTo(segmentedControl.snp.bottom).offset(24)
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview()
//        }
    }
}
