//
//  ProfileSettingsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//
import UIKit

class ProfileSettingsTableViewCell: UITableViewCell {
    
    var delegate: ProfileSettingsCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        //view.backgroundColor = .clear
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        imageView.tintColor = AppColors.black
        return imageView
    }()
    
    lazy var arrowIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: AssetTitles.arrowRightIcon)
        image.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
        image.tintColor = AppColors.black
        return image
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
    
    
    lazy var profileStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView, titleLabel, arrowIcon])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 13
        return stack
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        return button
    }()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do your cell set up
        self.contentView.backgroundColor = AppColors.white
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(1)
        }
        
        cellContentView.addSubview(profileStack)
        profileStack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalTo(separatorView.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        
        cellContentView.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(item: ProfileSettingsModel, index: IndexPath, delegate: ProfileSettingsCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = item.title
        self.iconImageView.image = UIImage(named: item.icon)
    }
    
    //MARK: Actions
    @objc func onCellTap() {
        self.delegate?.didSelectItemAt(index: self.index)
    }
}
