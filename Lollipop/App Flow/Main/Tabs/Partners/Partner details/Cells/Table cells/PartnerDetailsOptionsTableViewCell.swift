//
//  PartnerDetailsOptionsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

class PartnerDetailsOptionsTableViewCell: UITableViewCell {
    
    var delegate: PartnerDetailsOptionsCellProtocol?
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
    
    ///Locations
    lazy var locationsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetTitles.locationPitIcon)
        imageView.tintColor = AppColors.brandPrimary
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return imageView
    }()
    
    lazy var locationsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 12, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.text = LocalizedTitle.locations.localized
        return label
    }()
    
    lazy var locationsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onLocationsTap), for: .touchUpInside)
        return button
    }()
    
    lazy var locationsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [locationsIcon, locationsTitleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var locationsPlaceholderView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.addSubview(locationsStack)
        locationsStack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        view.addSubview(locationsButton)
        locationsButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    ///About
    lazy var aboutIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetTitles.infoIcon)
        imageView.tintColor = AppColors.brandPrimary
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return imageView
    }()
    
    lazy var aboutTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 12, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.text = LocalizedTitle.aboutProgramme.localized
        return label
    }()
    
    lazy var aboutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onAboutProgrammeTap), for: .touchUpInside)
        return button
    }()
    
    lazy var aboutStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [aboutIcon, aboutTitleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var aboutPlaceholderView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.addSubview(aboutStack)
        aboutStack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        view.addSubview(aboutButton)
        aboutButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    
    ///Rules
    lazy var rulesIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetTitles.termsIcon)
        imageView.tintColor = AppColors.brandPrimary
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(24)
        }
        return imageView
    }()
    
    lazy var rulesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 12, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.text = LocalizedTitle.rules.localized
        return label
    }()
    
    lazy var rulesButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onRulesTap), for: .touchUpInside)
        return button
    }()
    
    lazy var rulesStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [rulesIcon, rulesTitleLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    lazy var rulesPlaceholderView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.addSubview(rulesStack)
        rulesStack.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        view.addSubview(rulesButton)
        rulesButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var mainInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [locationsPlaceholderView, aboutPlaceholderView, rulesPlaceholderView])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 16
        return stack
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
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(24)
        }
        
        cellContentView.addSubview(mainInfoStack)
        mainInfoStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.height.equalTo(80)
        }
        
        self.selectionStyle = .none
        
    }
    func configureWith(index: IndexPath, delegate: PartnerDetailsOptionsCellProtocol) {
        self.index = index
        self.delegate = delegate
    }
    
    //MARK: Actions
    @objc func onLocationsTap(){
        delegate?.didTapLocations()
    }
    
    @objc func onAboutProgrammeTap(){
        delegate?.didTapAbout()
    }
    
    @objc func onRulesTap() {
        delegate?.didTapRules()
    }
}
