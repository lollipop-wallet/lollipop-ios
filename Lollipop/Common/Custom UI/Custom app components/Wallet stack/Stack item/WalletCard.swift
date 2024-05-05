//
//  WalletCard.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/05/2024.
//

import UIKit

class WalletCard: UIView {
    
    lazy var cardLogoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var cardLogoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .semibold)
        label.textColor = AppColors.white
        label.textAlignment = .left
        return label
    }()
    
    lazy var cardLogoPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(cardLogoIcon)
        cardLogoIcon.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
            make.width.height.equalTo(24)
        }
        view.addSubview(cardLogoTitleLabel)
        cardLogoTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(cardLogoIcon.snp.trailing).offset(8)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(4)
            make.bottom.equalToSuperview().offset(-4)
        }
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.black.withAlphaComponent(0.2)
        return view
    }()
    
    lazy var cardImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var mainPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(cardImage)
        cardImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(cardLogoPlaceholderView)
        cardLogoPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalToSuperview().offset(-2)
            make.height.equalTo(32)
        }
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    required init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
    }
    
    func setup() {
        self.addSubview(mainPlaceholderView)
        mainPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
