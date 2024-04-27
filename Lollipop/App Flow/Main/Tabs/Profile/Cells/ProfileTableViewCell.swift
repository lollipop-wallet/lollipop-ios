//
//  ProfileTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 27/04/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var delegate: ProfileCellProtocol?
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
    
    lazy var profileCellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(profileStack)
        profileStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
        return view
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
        self.contentView.backgroundColor = .clear
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        cellContentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(8)
        }
        
        cellContentView.addSubview(profileCellPlaceholderView)
        profileCellPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top).offset(-12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        
        cellContentView.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(item: ProfileListModel, index: IndexPath, delegate: ProfileCellProtocol) {
        self.index = index
        self.delegate = delegate
    }
    
    //MARK: Actions
    @objc func onCellTap() {
        self.delegate?.didSelectItemAt(index: self.index)
    }
}
