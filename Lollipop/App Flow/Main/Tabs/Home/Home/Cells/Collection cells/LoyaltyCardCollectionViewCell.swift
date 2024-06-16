//
//  LoyaltyCardCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 2.5.24..
//

import UIKit

class LoyaltyCardCollectionViewCell: UICollectionViewCell {
    
    var delegate: LoyaltyCardCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        //button.backgroundColor = .green
        return button
    }()
    
    lazy var seeAllCardsLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .semibold)
        label.textColor = AppColors.brandPrimary
        label.textAlignment = .center
        label.text = LocalizedTitle.seeAllCards.localized
        return label
    }()
    
    lazy var seeAllCardsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onSeeAllCardsTap), for: .touchUpInside)
        //button.backgroundColor = .green
        return button
    }()
    
    lazy var seeAllCardsPlaceHolder: UIView = {
        let view = UIView()
        view.addSubview(seeAllCardsLabel)
        seeAllCardsLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        view.addSubview(seeAllCardsButton)
        seeAllCardsButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
        return view
    }()

    
    lazy var photoPlaceHolder: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        view.addSubview(seeAllCardsPlaceHolder)
        seeAllCardsPlaceHolder.snp.makeConstraints { make in
            make.width.equalTo(170)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-34)
            make.centerX.equalToSuperview()
        }
        view.backgroundColor = AppColors.white
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(photoPlaceHolder)
        photoPlaceHolder.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWith(item: Card?, delegate: LoyaltyCardCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
        self.photo.imageFromURL(url: item?.cardType == .loyalty ? item?.card_template?.image_front ?? "" : item?.image_front ?? "")
        self.photo.isHidden = (item?.isSeeAllCards ?? false)
        self.seeAllCardsPlaceHolder.isHidden = !(item?.isSeeAllCards ?? false)
        self.photoPlaceHolder.backgroundColor = (item?.isSeeAllCards ?? false) ? AppColors.brandPrimary : AppColors.white
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
        delegate?.didSelectItemAt(index: self.index)
    }
    
    @objc func onSeeAllCardsTap() {
        delegate?.didTapSeeAllCards()
    }
}
