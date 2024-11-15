//
//  PartnerDetailsPromotionTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 05/06/2024.
//

import UIKit

class PartnerDetailsPromotionTableViewCell: UITableViewCell {
    
    var delegate: PartnerDetailsPromotionTableViewCellProtocol?
    var index: IndexPath!
    var datasource = [Banner]()
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear//AppColors.lightGrey
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        collectionView.register(PartnerDetailsPromotionCollectionViewCell.self, forCellWithReuseIdentifier: CellId.partnerDetailsPromotionCollectionCell.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear//AppColors.lightGrey
        return collectionView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 20, name: .bold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        return label
    }()
    
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(onSeeAllTap), for: .touchUpInside)
        button.setTitle(LocalizedTitle.seeAll.localized, for: .normal)
        button.titleLabel?.font = .inter(ofSize: 14, name: .semibold)
        button.setTitleColor(AppColors.brandPrimary, for: .normal)
        return button
    }()
    
    lazy var titleStack: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, seeAllButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    lazy var cellPlaceholderView: UIView = {
        let view = UIView()
        view.addSubview(titleStack)
        titleStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalToSuperview()
            make.height.equalTo(20)
        }
        view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleStack.snp.bottom).offset(24)
            make.bottom.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width * 0.64)
        }
        return view
    }()


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Do your cell set up
        self.layer.backgroundColor = UIColor.clear.cgColor
        self.contentView.backgroundColor = UIColor.clear
        self.contentView.addSubview(cellContentView)
        cellContentView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        cellContentView.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview().offset(32)
            make.leading.equalToSuperview()
            make.height.equalTo(32)
        }
        
        cellContentView.addSubview(cellPlaceholderView)
        cellPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        self.selectionStyle = .none
        
    }
    func configureWith(datasource: [Banner], index: IndexPath, delegate: PartnerDetailsPromotionTableViewCellProtocol) {
        self.backgroundColor = .clear
        self.index = index
        self.delegate = delegate
        self.datasource = datasource
        self.titleLabel.text = LocalizedTitle.ourPick.localized
        self.collectionView.reloadData()
    }
    
    //MARK: Actions
    @objc func onSeeAllTap() {
        delegate?.didTapSeeMoreFromPartnerDetailsCellCategory()
    }
}

extension PartnerDetailsPromotionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, PartnerDetailsPromotionCollectionViewCellProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.partnerDetailsPromotionCollectionCell.rawValue, for: indexPath) as! PartnerDetailsPromotionCollectionViewCell
        cell.configureWith(item: self.datasource[indexPath.row], delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        delegate?.didTapBannerWith(banner: item)
    }
}

extension PartnerDetailsPromotionTableViewCell {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0,trailing: 6)

        //let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(170), heightDimension: .estimated(216))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.435), heightDimension: .fractionalWidth(0.64))


        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize, subitem: item, count: 1)
        //group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0,trailing: 6)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 14, bottom: 0,trailing: 14)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
   }
}
