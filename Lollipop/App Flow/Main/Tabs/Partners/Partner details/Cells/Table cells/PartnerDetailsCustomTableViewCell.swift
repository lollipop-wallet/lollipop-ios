//
//  PartnerDetailsCustomTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

class PartnerDetailsCustomTableViewCell: UITableViewCell {
    
    var delegate: PartnerDetailsCustomCellProtocol?
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
    
    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        imageView.image = UIImage(named: AssetTitles.linkIcon)
        return imageView
    }()
    
    
    lazy var rightSupplementaryIcon: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        image.image = UIImage(named: AssetTitles.arrowRightIcon)
        image.tintColor = AppColors.black
        return image
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 18, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [itemImageView, titleLabel, rightSupplementaryIcon])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 16
        return stack
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cardCellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(cardStack)
        cardStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(12)
            make.bottom.trailing.equalToSuperview().offset(-12)
        }
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.borderColor = AppColors.brandPrimary.cgColor
        view.layer.borderWidth = 1.0
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
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(32)
        }
        
        cellContentView.addSubview(cardCellPlaceholderView)
        cardCellPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(56)
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(item: CustomLink?, index: IndexPath, delegate: PartnerDetailsCustomCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = item?.title ?? ""
    }
    
    //MARK: Actions
    @objc func onCellTap() {
    }
}
