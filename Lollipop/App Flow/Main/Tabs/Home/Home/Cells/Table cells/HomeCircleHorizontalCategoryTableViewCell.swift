//
//  HomeCircleHorizontalCategoryTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 03/05/2024.
//

import UIKit

class HomeCircleHorizontalCategoryTableViewCell: UITableViewCell {
    
    var delegate: CircledCategoryCellProtocol?
    var index: IndexPath!
    
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
        collectionView.register(CircledItemCollectionViewCell.self, forCellWithReuseIdentifier: CellId.circledItemCell.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        //collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear//AppColors.lightGrey
        return collectionView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .inter(ofSize: 20, name: .bold)
        label.textColor = AppColors.black
        label.textAlignment = .left
        label.text = "Popularno"
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
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleStack.snp.bottom).offset(24)
            make.height.equalTo(114)
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
        //self.contentView.backgroundColor = nil
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
    func configureWith(index: IndexPath, delegate: CircledCategoryCellProtocol) {
        self.backgroundColor = .clear
        self.index = index
        self.delegate = delegate
    }
    
    //MARK: Actions
    @objc func onSeeAllTap() {
        
    }
}

extension HomeCircleHorizontalCategoryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, CircledItemCellProtocol {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.circledItemCell.rawValue, for: indexPath) as! CircledItemCollectionViewCell
        cell.configureWith(delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}

extension HomeCircleHorizontalCategoryTableViewCell {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .estimated(114))

        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0,trailing: 20)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
   }
}
