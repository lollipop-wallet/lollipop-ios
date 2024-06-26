//
//  LocationsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/05/2024.
//

import UIKit

extension LocationsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        LocationsWireframe.createModule(LocationsRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.locations.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var locationCityIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.locationFilledIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
            imageView.tintColor = AppColors.brandPrimary
            return imageView
        }()
        
        lazy var locationCityArrowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.arrowDownIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
            return imageView
        }()
        
        self.locationCityLabel.font = .inter(ofSize: 14, name: .regular)
        self.locationCityLabel.textColor = AppColors.black
        self.locationCityLabel.textAlignment = .left
        self.locationCityLabel.text = LocalizedTitle.allCities.localized
        
        lazy var locationCityStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [locationCityIcon, self.locationCityLabel, locationCityArrowIcon])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var locationsCityButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onCityTap), for: .touchUpInside)
            return button
        }()
        
        lazy var locationCityPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(locationCityStack)
            locationCityStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.top.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().offset(-10)
            }
            view.addSubview(locationsCityButton)
            locationsCityButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white
            return view
        }()
        
        
        lazy var locationShopIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.storeFilledIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
            imageView.tintColor = AppColors.brandPrimary
            return imageView
        }()
        
        lazy var locationShopArrowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.arrowDownIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(16)
            }
            return imageView
        }()
        
        self.locationShopLabel.font = .inter(ofSize: 14, name: .regular)
        self.locationShopLabel.textColor = AppColors.black
        self.locationShopLabel.textAlignment = .left
        self.locationShopLabel.text = LocalizedTitle.allShops.localized
        
        lazy var locationShopStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [locationShopIcon, self.locationShopLabel, locationShopArrowIcon])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        
        lazy var locationsShopButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onShopTap), for: .touchUpInside)
            return button
        }()
        
        lazy var locationShopPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(locationShopStack)
            locationShopStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(8)
                make.trailing.equalToSuperview().offset(-8)
                make.top.equalToSuperview().offset(10)
                make.bottom.equalToSuperview().offset(-10)
            }
            view.addSubview(locationsShopButton)
            locationsShopButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 8
            view.layer.masksToBounds = true
            view.backgroundColor = AppColors.white
            return view
        }()
        
        lazy var filterStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [locationCityPlaceholderView, locationShopPlaceholderView])
            stack.axis = .horizontal
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.spacing = 8
            return stack
        }()
        
        lazy var locationsOverviewLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 14, name: .regular)
            label.textAlignment = .left
            label.textColor = AppColors.black
            label.text = "\(LocalizedTitle.locationsOverview.localized):"
            return label
        }()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: CellId.locationCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.lightGrey
        self.tableView.sectionHeaderTopPadding = 0
        
        self.view.addSubview(filterStack)
        filterStack.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        self.view.addSubview(locationsOverviewLabel)
        locationsOverviewLabel.snp.makeConstraints { make in
            make.top.equalTo(filterStack.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(filterStack.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
}
