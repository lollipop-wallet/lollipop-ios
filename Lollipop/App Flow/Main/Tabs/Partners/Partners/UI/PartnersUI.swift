//
//  PartnersUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension PartnersView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PartnersWireframe.createModule(PartnersRef: self)
        
        let appearance = UINavigationBarAppearance()
        let imgClose = UIImage(named: AssetTitles.closeIcon)?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 1.5, right: 0))
        appearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        appearance.setBackIndicatorImage(imgClose, transitionMaskImage: imgClose)
        navigationItem.standardAppearance = appearance
        UINavigationBar.appearance().layoutMargins.left = 20
        self.navigationItem.title = LocalizedTitle.ourPartners.localized
        
        lazy var segmentedControl: CustomSegmentedControl = {
            let control = CustomSegmentedControl(items: [LocalizedTitle.all.localized, LocalizedTitle.favorite.localized])
            control.selectedSegmentIndex = 0
            control.backgroundColor = AppColors.white
            control.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
            control.setTitleTextAttributes([.foregroundColor: AppColors.darkGrey, NSAttributedString.Key.font: UIFont.inter(ofSize: 14, name: .semibold)], for: .normal)
            control.setTitleTextAttributes([.foregroundColor: AppColors.white, NSAttributedString.Key.font:  UIFont.inter(ofSize: 14, name: .semibold)], for: .selected)
            return control
        }()
        
        lazy var scrollView : UIScrollView = {
            let scView = UIScrollView()
            return scView
        }()
        
        lazy var contentView : UIView = {
            let view = UIView()
            return view
        }()
        
        self.collectionView = AutomaticHeightCollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        self.collectionView?.register(PartnersCollectionViewCell.self, forCellWithReuseIdentifier: CellId.partnersCell.rawValue)
        self.collectionView?.delegate = presenter
        self.collectionView?.dataSource = presenter
        self.collectionView?.backgroundColor = AppColors.lightGrey
        self.collectionView?.isScrollEnabled = false

        lazy var partnersBannerTitle: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 20, name: .bold)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = LocalizedTitle.cantSeeFavoriteBrand.localized
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
        
        lazy var lollipopPartnerIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: AssetTitles.lollipopPartnerIcon)
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(64)
            }
            return imageView
        }()
        
        lazy var recommendPartnerLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 16, name: .regular)
            label.textColor = AppColors.black
            label.textAlignment = .left
            label.text = LocalizedTitle.recommendLollipopPartner.localized
            return label
        }()
        
        lazy var lollipopPartnerStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [lollipopPartnerIcon, recommendPartnerLabel, arrowIcon])
            stack.axis = .horizontal
            stack.distribution = .fill
            stack.alignment = .center
            stack.spacing = 8
            return stack
        }()
        
        lazy var lollipopPartnerButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onRecommendPartnerTap), for: .touchUpInside)
            return button
        }()
        
        lazy var lollipopPartnerPlaceholderView: UIView = {
            let view = UIView()
            view.addSubview(lollipopPartnerStack)
            lollipopPartnerStack.snp.makeConstraints { make in
                make.leading.top.equalToSuperview().offset(12)
                make.trailing.bottom.equalToSuperview().offset(-12)
            }
            view.addSubview(lollipopPartnerButton)
            lollipopPartnerButton.snp.makeConstraints { make in
                make.leading.trailing.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.brandPowder
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            
            view.snp.makeConstraints { make in
                make.height.equalTo(88)
            }
            return view
        }()
        
        lazy var lollipopSectionStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [partnersBannerTitle, lollipopPartnerPlaceholderView])
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 14
            return stack
        }()
        
        lazy var lollipopPartnerConainer: UIView = {
            let view = UIView()
            view.addSubview(lollipopSectionStack)
            lollipopSectionStack.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(10)
                make.trailing.equalToSuperview().offset(-4)
                make.top.bottom.equalToSuperview()
            }
            view.backgroundColor = AppColors.lightGrey
            return view
        }()
        
        lazy var fillerView: UIView = {
            let view = UIView()
            return view
        }()
        
        self.mainStackView = UIStackView(arrangedSubviews: [self.collectionView ?? UICollectionView(), lollipopPartnerConainer, fillerView])
        self.mainStackView.axis = .vertical
        self.mainStackView.distribution = .fill
        self.mainStackView.alignment = .fill
        self.mainStackView.spacing = 32
        
        lazy var heartIcon: UIImageView = {
            let view = UIImageView()
            view.image = UIImage(named: AssetTitles.outlinedHeartIcon)
            view.snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
            return view
        }()
        
        lazy var emptyFavTitleLabel: UILabel = {
            let label = UILabel()
            label.font = .inter(ofSize: 18, name: .semibold)
            label.textColor = AppColors.black
            label.textAlignment = .center
            label.text = LocalizedTitle.yourListIsEmpty.localized
            return label
        }()
        
        lazy var emptyFavButton: UIButton = {
            let button = UIButton()
            button.addTarget(self, action: #selector(onAddFavoriteShop), for: .touchUpInside)
            button.titleLabel?.font = .inter(ofSize: 16, name: .semibold)
            button.setTitleColor(AppColors.link, for: .normal)
            button.setTitle(LocalizedTitle.addFavoriteShops.localized, for: .normal)
            return button
        }()

        lazy var emptyTextStack: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [emptyFavTitleLabel, emptyFavButton])
            stack.axis = .vertical
            stack.distribution = .fill
            stack.alignment = .fill
            stack.spacing = 12
            return stack
        }()
        
        self.noFavoritesStackView = UIStackView(arrangedSubviews: [heartIcon, emptyTextStack])
        self.noFavoritesStackView.axis = .vertical
        self.noFavoritesStackView.distribution = .fill
        self.noFavoritesStackView.alignment = .center
        self.noFavoritesStackView.spacing = 24
        self.noFavoritesStackView.isHidden = true

        self.view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(32)
            make.height.equalTo(47)
        }
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView).inset(UIEdgeInsets.zero)
            make.width.equalTo(scrollView)
        }
        
        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(6)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }
        
        self.view.addSubview(self.noFavoritesStackView)
        self.noFavoritesStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension PartnersView {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.23))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 6, leading: 12, bottom: 6, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        return section
   }
}
