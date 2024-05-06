//
//  LocationsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

extension LocationsFilterView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        LocationsFilterWireframe.createModule(LocationsFilterRef: self)
        
        lazy var upperPullBar: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 2
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.darkGrey
            return view
        }()
        
        self.titleLabel.font = .inter(ofSize:  18, name: .bold)
        self.titleLabel.textAlignment = .left
        self.titleLabel.textColor = AppColors.black
        
        lazy var resetButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(reset), for: .touchUpInside)
            button.setTitle(LocalizedTitle.reset.localized, for: .normal)
            button.setTitleColor(AppColors.link, for: .normal)
            button.titleLabel?.font = .inter(ofSize: 16, name: .semibold)
            return button
        }()
        
        lazy var separator: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(LocationsFilterTableViewCell.self, forCellReuseIdentifier: CellId.locationFilterCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.white
        self.tableView.sectionHeaderTopPadding = 0
        
        self.view.addSubview(upperPullBar)
        upperPullBar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(4)
        }
        
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(28)
        }
        
        self.view.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-24)
            make.centerY.equalTo(self.titleLabel)
            make.height.equalTo(20)
        }
        
        self.view.addSubview(separator)
        separator.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.height.equalTo(2)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
           // make.bottom.equalToSuperview()
            make.top.equalTo(separator.snp.bottom)
        }
    }
}
