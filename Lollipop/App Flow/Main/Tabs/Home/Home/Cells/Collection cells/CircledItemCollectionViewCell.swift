//
//  CircledItemCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 03/05/2024.
//

import UIKit

class CircledItemCollectionViewCell: UICollectionViewCell {
    
    var delegate: CircledItemCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.text = "Sport Vision"
        return label
    }()

    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        //button.backgroundColor = .green
        return button
    }()
    
    lazy var photoPlaceHolder: UIView = {
        let view = UIView()

        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(20)
        }
        view.addSubview(photo)
        photo.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-6)
        }
        photo.layer.cornerRadius = 44
        
        
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.backgroundColor = AppColors.lightGrey
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
    
    func configureWith(delegate: CircledItemCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
        print("wdwda")
        delegate?.didSelectItemAt(index: self.index)
    }
}
