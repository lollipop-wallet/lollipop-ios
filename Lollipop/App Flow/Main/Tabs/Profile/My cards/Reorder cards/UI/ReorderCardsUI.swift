//
//  ReorderCardsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 01/05/2024.
//

import UIKit

extension ReorderCardsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ReorderCardsWireframe.createModule(ReorderCardsRef: self)

        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
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
        
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.tableView.separatorStyle = .none
        self.tableView.register(ReorderCardsTableViewCell.self, forCellReuseIdentifier: CellId.reorderCardCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        
        view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
