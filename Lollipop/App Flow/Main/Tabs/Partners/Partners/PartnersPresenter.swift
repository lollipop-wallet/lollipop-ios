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
    var delegate: PartnersControllerProtocol?
    
    var datasource = [Brand]()
    var completeDatasource = [Brand]()
    var favoriteDatasource = [Brand]()
    var selectedSegment = Int()
    
    func viewDidLoad() {
        MyShopsWireframe.delegate = self
        interactor?.viewDidLoad()
    }
    
    func suggestPartner() {
        wireframe?.toNewPartner()
    }
    
    func changeSegment(segment: Int){
        self.selectedSegment = segment
        if segment == 0 {
            self.datasource = completeDatasource
            self.view?.reload()
            self.view?.setEmptyStackHidden(isHidden: true)
        }else{
            self.datasource = favoriteDatasource
            self.view?.reload()
            self.view?.setEmptyStackHidden(isHidden: !favoriteDatasource.isEmpty)
        }
    }
    
    func addFavoriteShow(){
        if Manager.isRegistered {
            wireframe?.toMyShops(delegate: self)
        }else{
            delegate?.toProfileTab()
        }
    }
}

extension PartnersPresenter: PartnersOutputInteractorProtocol {
    func parsePartnersData(result: Result<[Brand], AFError>, delegate: PartnersControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let data):
            self.completeDatasource = data
            interactor?.getFavoriteParnters()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
    
    func parseFavoritePartnersData(result: Result<[Brand], AFError>){
        switch result {
        case .success(let data):
            self.favoriteDatasource = data
            self.datasource = self.completeDatasource
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
        let item = self.datasource[index.row]
        wireframe?.toPartnerDetails(alias: item.alias ?? "")
    }
}

//MARK: MyShopsController delegate
extension PartnersPresenter {
    func favoriteShopsUpdated(brands: [Brand]) {
        self.completeDatasource = brands
        self.favoriteDatasource = brands.filter { ($0.is_favorite ?? 0) == 1 }
        
        if self.selectedSegment == 0 {
            self.datasource = self.completeDatasource
            self.view?.reload()
            self.view?.setEmptyStackHidden(isHidden: true)
        }else{
            self.datasource = self.favoriteDatasource
            self.view?.reload()
            self.view?.setEmptyStackHidden(isHidden: !self.favoriteDatasource.isEmpty)
        }
    }
}
