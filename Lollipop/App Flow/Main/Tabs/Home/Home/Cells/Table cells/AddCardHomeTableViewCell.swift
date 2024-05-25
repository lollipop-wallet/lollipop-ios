//
//  AddCardHomeTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 2.5.24..
//

import UIKit

class AddCardHomeTableViewCell: UITableViewCell {
    
    var delegate: AddCardHomeCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var lightPurpleBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.brandPrimary.withAlphaComponent(0.2)
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 30, name: .bold)
        label.textAlignment = .left
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = LocalizedTitle.digitalizePlasticCardTitle.localized
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 14, name: .regular)
        label.textAlignment = .left
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = LocalizedTitle.digitalizePlasticCardSubtitle.localized
        return label
    }()
    
    lazy var textStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 6
        return stack
    }()
    
    lazy var addCardButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onAddCardTap), for: .touchUpInside)
        button.setTitle(LocalizedTitle.addCard.localized, for: .normal)
        button.backgroundColor = AppColors.white
        button.titleLabel?.font = .inter(ofSize: 14, name: .semibold)
        button.setTitleColor(AppColors.black, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var dataContentView: UIView = {
        let view = UIView()
        view.addSubview(textStack)
        textStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(16)
        }
        
        view.addSubview(addCardButton)
        addCardButton.snp.makeConstraints { make in
            make.width.equalTo(123)
            make.height.equalTo(40)
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(textStack.snp.bottom).offset(24)
        }
        
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.brandPrimary
        return view
    }()
    
    lazy var topPaddingView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.layer.cornerRadius = 32
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.shadowColor =  UIColor(red: 0.118, green: 0.118, blue: 0.118, alpha: 0.1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 8)
        view.layer.shadowRadius = 34
        return view
    }()
    
    lazy var shadowPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(topPaddingView)
        topPaddingView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(74)
        }
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(topPaddingView.snp.bottom)
        }
        
        view.addSubview(lightPurpleBackgroundView)
        lightPurpleBackgroundView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.top.equalToSuperview().offset(17)
            make.bottom.equalToSuperview().offset(-47)
        }
        
        view.addSubview(dataContentView)
        dataContentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().offset(-32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 40) * 0.64)
        }
        view.backgroundColor = AppColors.lightGrey

//        view.addSubview(dataPlaceholderView)
//        dataPlaceholderView.snp.makeConstraints { make in
//            make.leading.trailing.top.bottom.equalToSuperview()
//        }

        return view
    }()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do your cell set up
        self.contentView.backgroundColor = AppColors.white
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(32)
        }
        
        cellContentView.addSubview(shadowPlaceholderView)
        shadowPlaceholderView.snp.makeConstraints { make in
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.trailing.top.equalToSuperview()
        }
        self.selectionStyle = .none
        
    }
    func configureWith(index: IndexPath, delegate: AddCardHomeCellProtocol) {
        self.index = index
        self.delegate = delegate
    }
    
    //MARK: Actions
    @objc func onAddCardTap() {
        delegate?.didTapAddCard()
    }
}
