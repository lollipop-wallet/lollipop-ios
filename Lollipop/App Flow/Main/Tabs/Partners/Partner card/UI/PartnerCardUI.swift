//
//  PartnerCardUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 06/05/2024.
//

import UIKit

extension PartnerCardView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        PartnerCardWireframe.createModule(PartnerCardRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        self.cardImageView.contentMode = .scaleAspectFill
        self.cardImageView.layer.cornerRadius = 16
        self.cardImageView.layer.masksToBounds = true
        self.cardImageView.snp.makeConstraints { make in
            make.width.equalTo(self.view.frame.width - 66)
            make.height.equalTo((self.view.frame.width - 66) * 0.63)
        }
        self.cardImageView.backgroundColor = .red
        
        lazy var optionsLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = "\(LocalizedTitle.options.localized):"
            return label
        }()
        
        self.tableView.separatorStyle = .none
        self.tableView.register(PartnerCardTableViewCell.self, forCellReuseIdentifier: CellId.partnerCardCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.white
        self.tableView.sectionHeaderTopPadding = 0
        
        lazy var partnerOptionsStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [optionsLabel, self.tableView])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 12
            stack.snp.makeConstraints { make in
                make.width.equalTo(self.view.frame.width - 32)
            }
            return stack
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.cardImageView, partnerOptionsStack])
            stack.axis = .vertical
            stack.alignment = .center
            stack.distribution = .fill
            stack.spacing = 36
            return stack
        }()
        
        
        lazy var dataPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(mainStack)
            mainStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.bottom.equalToSuperview().offset(-23)
                make.top.equalToSuperview().offset(24)
            }
            view.backgroundColor = AppColors.white
            view.layer.cornerRadius = 32
            view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
        
        lazy var shaddowPlaceholderView: UIView = {
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
            
            view.addSubview(dataPlaceholderView)
            dataPlaceholderView.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }

            return view
        }()
        
        lazy var backgroundView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        backgroundView.addSubview(shaddowPlaceholderView)
        shaddowPlaceholderView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
    }
}
