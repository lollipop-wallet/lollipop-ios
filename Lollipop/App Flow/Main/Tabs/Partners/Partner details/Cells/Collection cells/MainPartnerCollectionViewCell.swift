//
//  MainPartnerCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

class MainPartnerCollectionViewCell: UICollectionViewCell {
    
    var delegate: MainPartnerCollectionCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear//AppColors.white
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
    
    lazy var partnerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 22, name: .bold)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.text = "Sport vision"
        return label
    }()
    
    lazy var bottomRectView: UIView = {
        let view = UIView()
        view.addSubview(partnerTitleLabel)
        partnerTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-24)
        }
        view.backgroundColor = AppColors.white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(4)
            make.trailing.bottom.equalToSuperview().offset(-4)
        }
        view.backgroundColor = AppColors.white
        view.layer.borderColor = AppColors.lightGrey.cgColor
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 40
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var mainPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(bottomRectView)
        bottomRectView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(40)
        }
        view.addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
            make.top.equalToSuperview()
        }
        view.backgroundColor = .clear
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
        
        cellContentView.addSubview(mainPlaceholderView)
        mainPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configureWith(delegate: MainPartnerCollectionCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
    }
}
