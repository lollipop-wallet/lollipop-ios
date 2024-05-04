//
//  PromotionsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PromotionsPresenter: NSObject, PromotionsPresenterProtocol  {
    
    var interactor : PromotionsInputInteractorProtocol?
    weak var view: PromotionsViewProtocol?
    var wireframe: PromotionsWireframeProtocol?
    
}

extension PromotionsPresenter: PromotionsOutputInteractorProtocol {
    
}

extension PromotionsPresenter {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.promotionsCell.rawValue, for: indexPath) as! PromotionsCollectionViewCell
        cell.configureWith(delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
        wireframe?.toDetails()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view?.setNavBarColor(shouldChange: scrollView.contentOffset.y > 0)
    }
}
