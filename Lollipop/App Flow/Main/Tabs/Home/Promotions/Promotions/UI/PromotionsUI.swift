//
//  PromotionsUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 3.5.24..
//

import UIKit

extension PromotionsView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        PromotionsWireframe.createModule(PromotionsRef: self)
        
        let standardAppearance = UINavigationBarAppearance()

        standardAppearance.titleTextAttributes = [.foregroundColor: AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        standardAppearance.backgroundColor = AppColors.lightGrey
        
        navigationItem.standardAppearance = standardAppearance
        
        self.navigationItem.title = LocalizedTitle.allPromotions.localized
        
        self.backButton.image = UIImage(named: AssetTitles.backIcon)?.withRenderingMode(.alwaysTemplate)
        self.backButton.tintColor = AppColors.black
        self.backButton.action = #selector(self.onBackTap)
        self.backButton.target = self
        
        self.navigationItem.leftBarButtonItems = [self.backButton]
        
        self.collectionView = AutomaticHeightCollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        self.collectionView?.register(PromotionsCollectionViewCell.self, forCellWithReuseIdentifier: CellId.promotionsCell.rawValue)
        self.collectionView?.delegate = presenter
        self.collectionView?.dataSource = presenter
        self.collectionView?.backgroundColor = AppColors.lightGrey
        
        self.view.addSubview(self.collectionView ?? UICollectionView())
        (self.collectionView ?? UICollectionView()).snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(14)
            make.trailing.equalToSuperview().offset(-14)
            make.bottom.equalToSuperview()
        }

    }
}

extension PromotionsView {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.85))
       let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 6, leading: 6, bottom: 6, trailing: 6)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
       let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
       return section
   }
}
