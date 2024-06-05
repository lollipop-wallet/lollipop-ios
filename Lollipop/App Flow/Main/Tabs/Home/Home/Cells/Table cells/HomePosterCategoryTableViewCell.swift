//
//  HomePosterCategoryTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

class HomePosterCategoryTableViewCell: UITableViewCell {
    
    var delegate: HomePosterCategoryCellProtocol?
    var index: IndexPath!
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var posterHeaderIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .red
        return imageView
    }()
    
    lazy var posterHeaderIconButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onBrandTap), for: .touchUpInside)
        return button
    }()
    
    lazy var posterHeaderIconPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(posterHeaderIcon)
        posterHeaderIcon.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.addSubview(posterHeaderIconButton)
        posterHeaderIconButton.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        view.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        return view
    }()
    
    lazy var posterHeaderTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 18, name: .semibold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.text = "Lolly"
        return label
    }()
    
    lazy var posterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()

    lazy var posterTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 22, name: .bold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Sve tvoje plastične kartice na jednom mjestu"
        return label
    }()
    
    lazy var posterHeaderStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [posterHeaderIconPlaceholderView, posterHeaderTitleLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    lazy var cellButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onCellTap), for: .touchUpInside)
        //button.backgroundColor = .green
        return button
    }()
    
    lazy var whiteContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.white
        view.addSubview(posterHeaderStack)
        posterHeaderStack.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        view.addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.top.equalTo(posterHeaderStack.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.width.height.equalTo((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 40)
        }
        
        view.addSubview(posterTitleLabel)
        posterTitleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(posterImage.snp.bottom).offset(12)
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        view.addSubview(cellButton)
        cellButton.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(posterHeaderStack.snp.bottom)
        }
        
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var mainPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(whiteContainerView)
        whiteContainerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.top.bottom.equalToSuperview()
        }
        view.backgroundColor = AppColors.lightGrey
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
        
        cellContentView.addSubview(mainPlaceholderView)
        mainPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        
        self.selectionStyle = .none
        
    }
    
    func configureWith(item: FeaturedBanner?, index: IndexPath, delegate: HomePosterCategoryCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.posterHeaderIcon.imageFromURL(url: item?.brand?.logo ?? "")
        self.posterImage.imageFromURL(url: item?.featured_image ?? "")
        self.posterHeaderTitleLabel.text = item?.brand?.name ?? ""
        self.posterTitleLabel.text = item?.title ?? ""
    }
    
    func configureWith(item: Banner?, index: IndexPath, delegate: HomePosterCategoryCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.posterHeaderIcon.imageFromURL(url: item?.brand?.logo ?? "")
        self.posterImage.imageFromURL(url: item?.featured_image ?? "")
        self.posterHeaderTitleLabel.text = item?.brand?.name ?? ""
        self.posterTitleLabel.text = item?.title ?? ""
    }
    
    //MARK: Actions
    @objc func onCellTap() {
        self.delegate?.didTapPosterWith(index: self.index)
    }
    
    @objc func onBrandTap(){
        self.delegate?.didTapPosterBrandWith(index: self.index)
    }
}
