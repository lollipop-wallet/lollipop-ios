//
//  PartnersCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 29.4.24..
//

import UIKit

class PartnersCollectionViewCell: UICollectionViewCell {
    
    var delegate: PartnersCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var partnerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        return button
    }()
    
    lazy var cellPlaceholderView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        view.addSubview(partnerImageView)
        partnerImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = AppColors.error
        
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        //
        cellContentView.addSubview(cellPlaceholderView)
        cellPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWith( index: IndexPath, delegate: PartnersCellProtocol){
        self.delegate = delegate
        self.index = index
    }
    
    
    //MARK: Actions
    @objc func onCellTap() {
    }
}
