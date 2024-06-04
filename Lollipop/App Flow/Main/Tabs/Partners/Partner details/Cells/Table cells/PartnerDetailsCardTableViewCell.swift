//
//  PartnerDetailsCardTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

class PartnerDetailsCardTableViewCell: UITableViewCell {
    
    var delegate: PartnerDetailsCardCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        //view.backgroundColor = .clear
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        view.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        return view
    }()
    
    lazy var midSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        view.snp.makeConstraints { make in
            make.height.equalTo(12)
        }
        return view
    }()
    
    lazy var separatorStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [separatorView, midSeparatorView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        return stack
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
        view.layer.borderColor = AppColors.white.withAlphaComponent(0.2).cgColor
        view.layer.borderWidth = 2
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
        image.image = UIImage(named: AssetTitles.arrowRightIcon)
        image.tintColor = AppColors.white
        return image
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 18, name: .semibold)
        label.textColor = AppColors.white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    lazy var cardStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [cardImageContainer, titleLabel, rightSupplementaryIcon])
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
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.brandPrimary
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
        
        cellContentView.addSubview(separatorStack)
        separatorStack.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(cardCellPlaceholderView)
        cardCellPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(card: EnhancedCardTemplate?, index: IndexPath, delegate: PartnerDetailsCardCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = card?.template?.name ?? ""
        self.cardImageView.imageFromURL(url: card?.template?.image_front ?? "")
        self.midSeparatorView.isHidden = card?.isLast ?? false
        self.separatorView.isHidden = !(card?.isLast ?? false)
    }
    
    //MARK: Actions
    @objc func onCellTap() {
        self.delegate?.didSelectCardTemplateItemAt(index: self.index)
    }
}
