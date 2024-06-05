//
//  PartnerDetailsPromotionCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/06/2024.
//

import UIKit

class PartnerDetailsPromotionCollectionViewCell: UICollectionViewCell {
    
    var delegate: PartnerDetailsPromotionCollectionViewCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var promotionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 16, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var fillerView : UIView = {
        let view = UIView()
        return view
    }()

    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        //button.backgroundColor = .green
        return button
    }()
    
    
    
    lazy var mainPlaceholder: UIView = {
        let view = UIView()
                
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(photo.snp.width).multipliedBy(1)
        }
        
        view.addSubview(promotionTitleLabel)
        promotionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(photo.snp.bottom).offset(12)
        }
            
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
        
        return view
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.contentView.backgroundColor = AppColors.lightGrey
        
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(mainPlaceholder)
        mainPlaceholder.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWith(item: Banner?, delegate: PartnerDetailsPromotionCollectionViewCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
        self.photo.imageFromURL(url: item?.featured_image ?? "")
        self.promotionTitleLabel.text = item?.title ?? ""
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
        delegate?.didSelectItemAt(index: self.index)
    }
}
