//
//  MyCardsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 30.4.24..
//

import UIKit

class MyCardsTableViewCell: UITableViewCell {
    
    var delegate: MyCardsCellProtocol?
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
    
    lazy var cardImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var cardImageContainer: UIView = {
        let view = UIView()
        view.addSubview(cardImageView)
        cardImageView.snp.makeConstraints { make in
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
    
    lazy var rightSupplementaryIcon: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
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
    
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardImageContainer, textStack, rightSupplementaryIcon])
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
    
    lazy var shopCellPlaceholderView: UIView = {
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
    func configureWith(index: IndexPath, delegate: MyCardsCellProtocol, isEditing: Bool) {
        self.index = index
        self.delegate = delegate
        //self.titleLabel.text = item.title
        //self.iconImageView.image = UIImage(named: item.flag)
        //self.checkBoxIcon.image = UIImage(named: item.selected ? AssetTitles.radioSelectedIcon : AssetTitles.radioUnselectedIcon)
        self.rightSupplementaryIcon.image = UIImage(named: isEditing ? "" : AssetTitles.arrowRightIcon)
        self.rightSupplementaryIcon.tintColor = isEditing ? AppColors.darkGrey : AppColors.black
        self.titleLabel.text = "Dameo"
        self.subtitleLabel.text = "1231521321521321"
    }
    
    //MARK: Actions
    @objc func onCellTap() {
        delegate?.didSelectItemAt(index: self.index)
    }
}