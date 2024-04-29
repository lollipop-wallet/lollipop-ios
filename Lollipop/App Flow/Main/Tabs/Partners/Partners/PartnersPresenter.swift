//
//  PartnersPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnersPresenter: NSObject, PartnersPresenterProtocol  {
    
    var interactor : PartnersInputInteractorProtocol?
    weak var view: PartnersViewProtocol?
    var wireframe: PartnersWireframeProtocol?
    
}

extension PartnersPresenter: PartnersOutputInteractorProtocol {
    
}

//MARK: UICollectionViewDelegate&Datasource
extension PartnersPresenter {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.partnersCell.rawValue, for: indexPath) as! PartnersCollectionViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}
