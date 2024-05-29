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
        
        lazy var segmentedControl: CustomSegmentedControl = {
            let control = CustomSegmentedControl(items: [LocalizedTitle.allCards.localized, LocalizedTitle.favoriteCards.localized])
            control.selectedSegmentIndex = 0
            control.backgroundColor = AppColors.white
            control.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
            control.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey, NSAttributedString.Key.font: UIFont.inter(ofSize: 14, name: .semibold)], for: .normal)
            control.setTitleTextAttributes([.foregroundColor: AppColors.white, NSAttributedString.Key.font:  UIFont.inter(ofSize: 14, name: .semibold)], for: .selected)
            return control
        }()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(MyCardsTableViewCell.self, forCellReuseIdentifier: CellId.myCardsCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.sectionHeaderTopPadding = 0
        
        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(47)
        }

        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
}
