//
//  ScanSuggestionUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

extension ScanSuggestionView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        ScanSuggestionWireframe.createModule(ScanSuggestionRef: self)
        
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 30, name: .bold)]
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        let imgBackArrow = UIImage(named: AssetTitles.backIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.setBackIndicatorImage(imgBackArrow, transitionMaskImage: imgBackArrow)
        appearance.backgroundColor = AppColors.lightGrey
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        
        self.navigationItem.title = LocalizedTitle.loyaltyCards.localized
        
        lazy var backButton: UIBarButtonItem = {
            let button = UIBarButtonItem()
            button.image = UIImage(named: AssetTitles.backIcon)
            button.tintColor = AppColors.black
            button.action = #selector(self.onBackTap)
            button.target = self
            return button
        }()
        
        self.navigationItem.leftBarButtonItems = [backButton]
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()

        self.tableView.separatorStyle = .none
        self.tableView.register(ScanSuggestionTableViewCell.self, forCellReuseIdentifier: CellId.scanSuggestionCell.rawValue)
        self.tableView.delegate = presenter
        self.tableView.dataSource = presenter
        self.tableView.backgroundColor = AppColors.error
        self.tableView.sectionHeaderTopPadding = 0
        
        lazy var barcodeIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.scanBarcodeIcon)
            imageView.tintColor = AppColors.brandPrimary
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(32)
            }
            return imageView
        }()
        
        lazy var barcodePlaceholder: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.white.withAlphaComponent(0.3)
            view.addSubview(barcodeIcon)
            barcodeIcon.snp.makeConstraints { make in
                make.centerX.centerY.equalToSuperview()
            }
            view.layer.cornerRadius = 32
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.width.height.equalTo(64)
            }
            return view
        }()
        
        lazy var addLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = LocalizedTitle.addCard.localized
            return label
        }()
        
        lazy var arrowIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.arrowRightIcon)
            imageView.tintColor = AppColors.black
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(24)
            }
            return imageView
        }()
        
        lazy var addCardStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [barcodePlaceholder, addLabel, arrowIcon])
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 8
            return stack
        }()
        
        lazy var newCardButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onNewCardTap), for: .touchUpInside)
            return button
        }()
        
        lazy var addCardPlaceholderView: UIView = {
            let view = UIView()
            view.backgroundColor = AppColors.brandPowder
            view.addSubview(addCardStack)
            addCardStack.snp.makeConstraints { make in
                make.top.leading.equalToSuperview().offset(12)
                make.bottom.trailing.equalToSuperview().offset(-12)
            }
            view.addSubview(newCardButton)
            newCardButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.snp.makeConstraints { make in
                make.height.equalTo(88)
            }
            return view
        }()
        
        lazy var addCardTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 20, name: .bold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = LocalizedTitle.cantSeeCardInTheList.localized
            return label
        }()
        
        lazy var addCardMainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [addCardTitleLabel, addCardPlaceholderView])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 14
            return stack
        }()
        
        lazy var mainStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [self.tableView, addCardMainStack])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 24
            return stack
        }()
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-61)
            make.top.equalToSuperview()
        }

//        self.view.addSubview(self.tableView)
//        self.tableView.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.bottom.equalToSuperview()
//        }
//        
//        self.view.addSubview(addCardPlaceholderView)
//        addCardPlaceholderView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.bottom.equalToSuperview().offset(-40)
//            make.height.equalTo(40)
//            make.width.equalTo(160)
//        }
    }
}
