//
//  LoyaltyCard.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 4.5.24..
//

import UIKit

class LoyaltyCard: UIView {
    
    open var pointsHidden: Bool? {
        set {
            self.pointsMainStackView.isHidden = newValue ?? false
            self.loyaltyPlaceholderFooter.backgroundColor = .clear
        }
        get { return true }
    }
    
    open var imageUrl: String? {
        set { self.loyaltyCardImage.imageFromURL(url: newValue ?? "") }
        get { return "" }
    }
    
    open var pointsTitle: String? {
        set { self.pointsTitleLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var points: String? {
        set { self.pointsValueLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    open var updatedAt: String? {
        set { self.lastUpdateLabel.text = newValue ?? "" }
        get { return "" }
    }
    
    lazy var loyaltyCardImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 16
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    lazy var loyaltyPlaceholderHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var loyaltyPlaceholderFooter: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.brandPowder
        return view
    }()
    
    lazy var loyaltyCardPlaceholder: UIView = {
        let view = UIView()
        
        view.addSubview(loyaltyPlaceholderHeader)
        loyaltyPlaceholderHeader.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(24)
        }
        
        view.addSubview(loyaltyPlaceholderFooter)
        loyaltyPlaceholderFooter.snp.makeConstraints { make in
            make.top.equalTo(loyaltyPlaceholderHeader.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        view.addSubview(loyaltyCardImage)
        loyaltyCardImage.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.height.equalTo(view.snp.width).multipliedBy(0.63)
        }
        return view
    }()
    
    lazy var pointsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.text = "Ukupno bodova:"
        return label
    }()
    
    lazy var pointsValueLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 28, name: .bold)
        label.textColor = AppColors.black
        label.textAlignment = .right
        label.text = "159"
        return label
    }()
    
    lazy var pointsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [pointsTitleLabel, pointsValueLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    lazy var pointsPlaceholder: UIView = {
        let view = UIView()
        view.addSubview(pointsStackView)
        pointsStackView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(-16)
            make.height.equalTo(32)
        }
        view.backgroundColor = AppColors.brandPowder
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.snp.makeConstraints { make in
            make.height.equalTo(70)
        }
        return view
    }()
    
    lazy var lastUpdateLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 10, name: .regular)
        label.textAlignment = .center
        label.textColor = AppColors.darkGrey
        label.text = "Posljednje ažuriranje podataka: 12.03.2024 u 08:42"
        return label
    }()
    
    lazy var pointsMainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [pointsPlaceholder, lastUpdateLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 8
        return stack
    }()
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loyaltyCardPlaceholder, pointsMainStackView])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        return stack
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
        self.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
