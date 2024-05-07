//
//  PartnerDetailsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

extension PartnerDetailsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnerDetailsWireframe.createModule(PartnerDetailsRef: self)
        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .blue//AppColors.lightGrey
        self.tableView.register(MainPartnerTableViewCell.self, forCellReuseIdentifier: CellId.mainPartnerCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.sectionHeaderTopPadding = 0
        self.tableView.contentInsetAdjustmentBehavior = .never
        
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
