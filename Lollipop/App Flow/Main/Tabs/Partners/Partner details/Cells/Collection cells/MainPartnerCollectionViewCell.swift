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
    
    lazy var bottomRectView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.error
        view.layer.cornerRadius = view.frame.height / 2
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
            make.width.equalTo(circleView.snp.height)
            make.top.equalToSuperview()
        }
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
    
    func configureWith(delegate: MainPartnerCollectionCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
    }
}
