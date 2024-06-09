//
//  LanguageTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 28/04/2024.
//

import UIKit

class LanguageTableViewCell: UITableViewCell {
    
    var delegate: LanguageTableViewCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        //view.backgroundColor = .clear
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        imageView.tintColor = AppColors.black
        return imageView
    }()
    
    lazy var radioIcon: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var radioButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onRadioTap), for: .touchUpInside)
        return button
    }()
    
    lazy var radioContainerView: UIView = {
        let view = UIView()
        view.addSubview(radioIcon)
        radioIcon.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(radioButton)
        radioButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return view
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 16, name: .regular)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    
    lazy var languageStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconImageView, titleLabel, radioContainerView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 13
        return stack
    }()
    
    lazy var languageCellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(languageStack)
        languageStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
        return view
    }()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do your cell set up
        self.contentView.backgroundColor = AppColors.lightGrey
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
            make.height.equalTo(8)
        }
        
        cellContentView.addSubview(languageCellPlaceholderView)
        languageCellPlaceholderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(item: Language, index: IndexPath, delegate: LanguageTableViewCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.titleLabel.text = item.localizedName
        self.iconImageView.image = UIImage(named: item.icon)
        self.radioIcon.image = UIImage(named: (item.selected ?? false) ? AssetTitles.radioSelectedIcon : AssetTitles.radioUnselectedIcon)
    }
    
    //MARK: Actions
    @objc func onRadioTap() {
        self.delegate?.didSelectItemAt(index: self.index)
    }
}
