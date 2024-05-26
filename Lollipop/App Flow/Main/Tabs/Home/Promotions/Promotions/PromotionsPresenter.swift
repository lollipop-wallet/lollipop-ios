//
//  PromotionsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class PromotionsPresenter: NSObject, PromotionsPresenterProtocol  {
    
    var interactor : PromotionsInputInteractorProtocol?
    weak var view: PromotionsViewProtocol?
    var wireframe: PromotionsWireframeProtocol?
    
    var datasource = [Banner]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension PromotionsPresenter: PromotionsOutputInteractorProtocol {
    func parsePromotionsData(result: Result<[Banner], AFError>){
        switch result {
        case .success(let data):
            self.datasource = data
            self.view?.reload()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

extension PromotionsPresenter {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.promotionsCell.rawValue, for: indexPath) as! PromotionsCollectionViewCell
        cell.configureWith(item: self.datasource[indexPath.row], delegate: self, index: indexPath)
        return cell
    }
    
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        wireframe?.toDetailsWith(banner: item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.view?.setNavBarColor(shouldChange: scrollView.contentOffset.y > 0)
    }
}
