//
//  LocationsFilterTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

class LocationsFilterTableViewCell: UITableViewCell {
    
    var delegate: LocationsFilterCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var shopImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var shopImageContainer: UIView = {
        let view = UIView()
        view.addSubview(shopImageView)
        shopImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.snp.makeConstraints { make in
            make.width.equalTo(72)
            make.height.equalTo(47)
        }
        view.backgroundColor = .red
        return view
    }()
    
    lazy var checkBoxIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCheckBoxTap), for: .touchUpInside)
        return button
    }()
    
    lazy var checkBoxContainerView: UIView = {
        let view = UIView()
        view.addSubview(checkBoxIcon)
        checkBoxIcon.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(checkBoxButton)
        checkBoxButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 16, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    lazy var shopStackStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [checkBoxContainerView, titleLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var locationCellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(shopStackStack)
        shopStackStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
            make.bottom.trailing.equalToSuperview().offset(-12)
        }
        return view
    }()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do your cell set up
        self.contentView.backgroundColor = AppColors.lightGrey
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(locationCellPlaceholderView)
        locationCellPlaceholderView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            //make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.selectionStyle = .none
        
    }
    func configureWithCity(city: City?, index: IndexPath, delegate: LocationsFilterCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = city?.cityName ?? ""
        self.checkBoxIcon.image = UIImage(named: (city?.selected ?? false) ?  AssetTitles.checkBoxSelectedIcon : AssetTitles.checkBoxUnselectedIcon)
    }
    
    func configureWithBrand(brand: Brand?, index: IndexPath, delegate: LocationsFilterCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = brand?.name ?? ""
        self.checkBoxIcon.image = UIImage(named: (brand?.selected ?? false) ?  AssetTitles.checkBoxSelectedIcon : AssetTitles.checkBoxUnselectedIcon)
    }
    
    //MARK: Actions
    @objc func onCheckBoxTap() {
        self.delegate?.didSelectItemAt(index: self.index)
    }
}
