//
//  PromotionsCollectionViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

class PromotionsCollectionViewCell: UICollectionViewCell {
    
    var delegate: PromotionsCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var logo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(32)
        }
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    lazy var promotionTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 16, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.text = "Vraća novac, na svakoj Petrol stanici"
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    lazy var partnerTitle: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 12, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.text = "Petrol"
        return label
    }()
    
    
    lazy var titleFooterStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [logo, partnerTitle])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    lazy var fillerView : UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contentStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [promotionTitleLabel, fillerView, titleFooterStack])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
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
            make.height.equalTo((((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 52) / 2))
        }
        
        view.addSubview(promotionTitleLabel)
        promotionTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(photo.snp.bottom).offset(12)
        }
        
        view.addSubview(titleFooterStack)
        titleFooterStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalTo(-12)
            make.height.equalTo(32)
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
    
    func configureWith(delegate: PromotionsCellProtocol, index: IndexPath) {
        self.delegate = delegate
        self.index = index
    }
    
    
    //MARK: Actions
    
    @objc func onCellTap(){
        delegate?.didSelectItemAt(index: self.index)
    }
}
