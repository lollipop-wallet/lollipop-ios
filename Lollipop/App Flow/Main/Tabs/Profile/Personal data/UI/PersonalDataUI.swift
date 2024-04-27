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
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
        }
    }
}
