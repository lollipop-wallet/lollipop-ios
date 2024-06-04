//
//  PartnerDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class PartnerDetailsPresenter: NSObject, PartnerDetailsPresenterProtocol  {
    
    var interactor : PartnerDetailsInputInteractorProtocol?
    weak var view: PartnerDetailsViewProtocol?
    var wireframe: PartnerDetailsWireframeProtocol?
    
    var datasource = [PartnerListModel]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension PartnerDetailsPresenter: PartnerDetailsOutputInteractorProtocol {
    func takeData(alias: String) {
        self.interactor?.getDetails(alias: alias)
    }
    
    func parseBrandDetailsData(result: Result<PartnerDetailsModel, AFError>){
        switch result {
        case .success(let model):
            let brandsListModelItem = PartnerListModel(cards: [], brands: model.partner?.brands ?? [], featuredBanner: nil, banners: [], itemType: .brand)
            self.datasource.append(brandsListModelItem)
            self.view?.reload()
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: UITableViewDelegate&Datasource
extension PartnerDetailsPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.datasource[indexPath.row].itemType == .brand {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.mainPartnerCell.rawValue, for: indexPath) as! MainPartnerTableViewCell
            cell.configureWith(brands: self.datasource[indexPath.row].brands ?? [], index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .card {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.parnterDetailsCardCell.rawValue, for: indexPath) as! PartnerDetailsCardTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .options {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsOptionsCell.rawValue, for: indexPath) as! PartnerDetailsOptionsTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .poster {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homePosterCell.rawValue, for: indexPath) as! HomePosterCategoryTableViewCell
            cell.configureWith(item: nil, index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .promotion {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeRectItemCell.rawValue, for: indexPath) as! HomeRectHorizontalCategoryTableViewCell
            cell.configureWith(datasource: [], index: indexPath, delegate: self)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsCustomCell.rawValue, for: indexPath) as! PartnerDetailsCustomTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }
    }
    
    func didTapSeeMoreFromRectCategory() {
    }
    
    func didTapBannerWith(banner: Banner?) {
    }
    
    
}
