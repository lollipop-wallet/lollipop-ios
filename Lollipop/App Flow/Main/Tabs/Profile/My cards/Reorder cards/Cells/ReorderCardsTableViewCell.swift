//
//  ReorderCardsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 30/05/2024.
//

import UIKit

class ReorderCardsTableViewCell: UITableViewCell {
    
    var delegate: ReorderCardsCellProtocol?
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
        return view
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
    
    lazy var reorderIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: AssetTitles.reorderIcon)
        image.tintColor = AppColors.darkGrey
        return image
    }()
    
    lazy var reorderContainerView: UIView = {
        let view = UIView()
        view.addSubview(reorderIcon)
        reorderIcon.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return view
    }()
    
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardImageContainer, textStack, reorderContainerView])
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
            make.leading.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(-36)
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
    func configureWith(item: Card?, index: IndexPath, delegate: ReorderCardsCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = item?.name ?? ""
        self.subtitleLabel.text = item?.code ?? ""
        self.cardImageView.imageFromURL(url: item?.cardType == .loyalty ? item?.card_template?.image_front ?? "" : (item?.card_template != nil ? (item?.card_template?.image_front ?? "") : item?.image_front ?? ""))
    }
    
    //MARK: Actions
    
    @objc func onCellTap() {
        
    }
}
