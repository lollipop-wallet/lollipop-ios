//
//  HomeCardTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 2.5.24..
//

import UIKit

class HomeCardTableViewCell: UITableViewCell {
    
    var delegate: HomeCardCellProtocol?
    var index: IndexPath!
    var datasource = [Card]()
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
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
        view.layer.shadowOffset = CGSize(width: 0, height: 28)
        view.layer.shadowRadius = 36
        return view
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = AppColors.brandPrimary
        pageControl.pageIndicatorTintColor = AppColors.mediumGrey
        return pageControl
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        collectionView.register(LoyaltyCardCollectionViewCell.self, forCellWithReuseIdentifier: CellId.loyaltyCardCell.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = AppColors.white
        return collectionView
    }()
    
    lazy var dataContentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 32
        view.layer.masksToBounds = true
        view.backgroundColor = AppColors.white
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-24)
            //make.height.equalTo(8)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.bottom.equalTo(pageControl.snp.top).offset(-24)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview()
            make.height.equalTo(((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 68) * 0.63)
        }
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
        view.addSubview(dataContentView)
        dataContentView.snp.makeConstraints { make in
            make.leading.trailing.bottom.top.equalToSuperview()
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
            make.trailing.equalToSuperview().offset(32)
            make.leading.equalToSuperview()
            make.height.equalTo(32)
        }
        
        cellContentView.addSubview(shadowPlaceholderView)
        shadowPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        self.selectionStyle = .none
        
    }
    func configureWith(cards: [Card], index: IndexPath, delegate: HomeCardCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.datasource = cards
        self.collectionView.reloadData()
        self.pageControl.numberOfPages = cards.count
    }
    
    //MARK: Actions
}

extension HomeCardTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, LoyaltyCardCellProtocol, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.loyaltyCardCell.rawValue, for: indexPath) as! LoyaltyCardCollectionViewCell
        cell.configureWith(item: self.datasource[indexPath.row], delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}

extension HomeCardTableViewCell {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 48), heightDimension: .estimated(((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 68) * 0.63))
        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize, subitem: item, count: 1)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0,trailing: 8)
        let section = NSCollectionLayoutSection(group: group)

        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) -> Void in
            guard let self = self, let itemWidth = items.last?.bounds.width else { return }
            let page = round(offset.x / (itemWidth + section.interGroupSpacing))
            self.pageControl.currentPage = Int(page)
        }
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
   }
}
