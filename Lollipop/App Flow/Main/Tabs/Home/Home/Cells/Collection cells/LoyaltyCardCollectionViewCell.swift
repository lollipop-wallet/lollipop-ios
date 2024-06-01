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
        view.backgroundColor = AppColors.brandPrimary
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
        print("Slika je: ", item?.image_front ?? "")
        self.photo.imageFromURL(url: item?.cardType == .loyalty ? item?.card_template?.image_front ?? "" : item?.image_front ?? "")
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
        delegate?.didSelectItemAt(index: self.index)
    }
}
