//
//  MainPartnerDetailsTableViewCell.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 07/05/2024.
//

import UIKit

class MainPartnerTableViewCell: UITableViewCell {
    
    var delegate: MainPartnerCellProtocol?
    var index: IndexPath!
    
    var datasource = [Brand]()
    var scrollIndex = Int()
    var previousScrollIndex = Int()
    
    lazy var cellContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.lightGrey
        return view
    }()
    
    lazy var partnerBackgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
        
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = AppColors.brandPrimary
        pageControl.pageIndicatorTintColor = AppColors.mediumGrey
        return pageControl
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        collectionView.register(MainPartnerCollectionViewCell.self, forCellWithReuseIdentifier: CellId.mainPartnerCollectionCell.rawValue)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isUserInteractionEnabled = true
        collectionView.backgroundColor = .clear//AppColors.white
        return collectionView
    }()
    
    lazy var mainPlaceholderView: UIView = {
        let view = UIView()
        
        view.addSubview(partnerBackgroundImage)
        partnerBackgroundImage.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo((UIApplication.topViewController()?.view.frame.width ?? 1.0) * 0.67)
        }
        
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalToSuperview().offset(-4)
            make.top.equalTo(partnerBackgroundImage.snp.bottom).offset(75)
            make.height.equalTo(8)
        }
//        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(176)
            make.bottom.equalTo(pageControl.snp.top).offset(-24)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview()
            make.height.equalTo(143)
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
            make.height.equalTo(24)
        }
        
        cellContentView.addSubview(mainPlaceholderView)
        mainPlaceholderView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalTo(separatorView.snp.top)
        }
        self.selectionStyle = .none
        
    }
    func configureWith(brands: [Brand], partnerSelectedIndex: Int, index: IndexPath, delegate: MainPartnerCellProtocol) {
        self.index = index
        self.delegate = delegate
        self.datasource = brands
        //self.collectionView.reloadData()
        self.pageControl.numberOfPages = brands.count
        self.partnerBackgroundImage.imageFromURL(url: brands[partnerSelectedIndex].featured_image ?? "")
        self.scrollIndex = 0
    }
    
    //MARK: Actions
}

extension MainPartnerTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, MainPartnerCollectionCellProtocol, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.mainPartnerCollectionCell.rawValue, for: indexPath) as! MainPartnerCollectionViewCell
        cell.configureWith(brand: self.datasource[indexPath.row], delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
    }
}

extension MainPartnerTableViewCell {
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
       return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
           return self.generateFlowLayout()
      }
   }
   
    private func generateFlowLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(30))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute((UIApplication.topViewController()?.view.frame.width ?? 1.0) - 142), heightDimension: .absolute(143))
        let group = NSCollectionLayoutGroup.vertical( layoutSize: groupSize, subitem: item, count: 1)
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0,trailing: 8)
        let section = NSCollectionLayoutSection(group: group)
        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) -> Void in
            guard let self = self, let itemWidth = items.last?.bounds.width else { return }
            let page = round(offset.x / (itemWidth + section.interGroupSpacing))
            let index = Int(page)
            if self.scrollIndex != index && index <= self.datasource.count - 1{
                self.scrollIndex = index
                self.delegate?.getPartnerWith(alias: self.datasource[self.scrollIndex].alias ?? "", selectedIndex: self.scrollIndex)
            }
            self.pageControl.currentPage = Int(page)
        }
        
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        return section
   }
}
