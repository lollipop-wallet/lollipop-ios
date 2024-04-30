//
//  MyShopsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 30.4.24..
//

import UIKit

class MyShopsTableViewCell: UITableViewCell {
    
    var delegate: MyShopsCellProtocol?
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
    
    lazy var shopImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.equalTo(72)
        }
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
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
        let stack = UIStackView(arrangedSubviews: [shopImageView, titleLabel, checkBoxContainerView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 13
        return stack
    }()
    
    lazy var shopCellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(shopStackStack)
        shopStackStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
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
        
        cellContentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(8)
        }
        
        cellContentView.addSubview(shopCellPlaceholderView)
        shopCellPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(index: IndexPath, delegate: MyShopsCellProtocol) {
        self.index = index
        self.delegate = delegate
        //self.titleLabel.text = item.title
        //self.iconImageView.image = UIImage(named: item.flag)
        //self.checkBoxIcon.image = UIImage(named: item.selected ? AssetTitles.radioSelectedIcon : AssetTitles.radioUnselectedIcon)
    }
    
    //MARK: Actions
    @objc func onCheckBoxTap() {
        self.delegate?.didSelectItemAt(index: self.index)
    }
}
