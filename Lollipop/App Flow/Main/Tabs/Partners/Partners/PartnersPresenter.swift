//
//  PartnersPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class PartnersPresenter: NSObject, PartnersPresenterProtocol  {
    
    var interactor : PartnersInputInteractorProtocol?
    weak var view: PartnersViewProtocol?
    var wireframe: PartnersWireframeProtocol?
    
    var datasource = [Brand]()
    var completeDatasource = [Brand]()
    var favoriteDatasource = [Brand]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func suggestPartner() {
        wireframe?.toNewPartner()
    }
}

extension PartnersPresenter: PartnersOutputInteractorProtocol {
    func parsePartnersData(result: Result<[Brand], AFError>) {
        switch result {
        case .success(let data):
            self.completeDatasource = data
            self.datasource = data
            self.view?.reload()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UICollectionViewDelegate&Datasource
extension PartnersPresenter {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellId.partnersCell.rawValue, for: indexPath) as! PartnersCollectionViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        wireframe?.toPartnerDetails()
    }
}
