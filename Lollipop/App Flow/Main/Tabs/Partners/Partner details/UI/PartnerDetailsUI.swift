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
        
        lazy var backButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onBackTap), for: .touchUpInside)
            button.setImage(UIImage(named: AssetTitles.backRoundedIcon), for: .normal)
            return button
        }()
        
        self.favoriteButton.addTarget(self, action: #selector(onFavoriteTap), for: .touchUpInside)
        self.favoriteButton.setImage(UIImage(named: AssetTitles.favoriteRoundedIcon), for: .normal)

        
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.register(MainPartnerTableViewCell.self, forCellReuseIdentifier: CellId.mainPartnerCell.rawValue)
        self.tableView.register(PartnerDetailsCardTableViewCell.self, forCellReuseIdentifier: CellId.parnterDetailsCardCell.rawValue)
        self.tableView.register(PartnerDetailsOptionsTableViewCell.self, forCellReuseIdentifier: CellId.partnerDetailsOptionsCell.rawValue)
        self.tableView.register(HomePosterCategoryTableViewCell.self, forCellReuseIdentifier: CellId.homePosterCell.rawValue)
        self.tableView.register(PartnerDetailsPromotionTableViewCell.self, forCellReuseIdentifier: CellId.partnerDetailsPromotionTableCell.rawValue)
        self.tableView.register(PartnerDetailsCustomTableViewCell.self, forCellReuseIdentifier: CellId.partnerDetailsCustomCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.sectionHeaderTopPadding = 0
        self.tableView.contentInsetAdjustmentBehavior = .never
        
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.leading.equalToSuperview().offset(24)
            make.top.equalToSuperview().offset(60)
        }
        
        self.view.addSubview(self.favoriteButton)
        self.favoriteButton.snp.makeConstraints { make in
            make.width.height.equalTo(48)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(60)
        }
    }
}
