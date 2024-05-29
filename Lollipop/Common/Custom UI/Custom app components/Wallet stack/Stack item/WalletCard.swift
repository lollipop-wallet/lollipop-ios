//
//  WalletCard.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/05/2024.
//

import UIKit

class WalletCard: UIView {
    
    open var background: UIColor? {
        set { self.mainPlaceholderView.backgroundColor = newValue ?? .clear }
        get { return .white }
    }
    
    open var logoIcon: String? {
        set { self.cardLogoIcon.imageFromURL(url: newValue ?? "") }
        get { return "" }
    }
    
    open var cardBackgroundImage : String? {
        set { self.cardImage.imageFromURL(url: newValue ?? "") }
        get { return "" }
    }
    
    open var partnerName : String? {
        set { self.cardLogoTitleLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    var delegate: WalletCardProtocol?
    
    lazy var cardLogoIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .black
        return imageView
    }()
    
    lazy var cardLogoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .semibold)
        label.textColor = AppColors.white
        label.textAlignment = .left
        label.text = "Petrol"
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
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var cardButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCardTap), for: .touchUpInside)
        return button
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
            make.leading.equalToSuperview().offset(2)
            make.height.equalTo(32)
        }
        view.addSubview(cardButton)
        cardButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 16
        
        view.layer.shadowColor =  UIColor(red: 0.25, green: 0.129, blue: 0.444, alpha: 0.5).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
        view.layer.shadowRadius = 24
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
    
    //MARK: Actions
    @objc func onCardTap() {
        delegate?.didTapCardWith(tag: self.tag)
    }    
}

protocol WalletCardProtocol: AnyObject {
    func didTapCardWith(tag: Int)
}
