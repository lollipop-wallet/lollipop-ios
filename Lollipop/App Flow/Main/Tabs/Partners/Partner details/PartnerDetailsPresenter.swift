//
//  PartnerDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire
import SafariServices

class PartnerDetailsPresenter: NSObject, PartnerDetailsPresenterProtocol  {
    
    var interactor : PartnerDetailsInputInteractorProtocol?
    weak var view: PartnerDetailsViewProtocol?
    var wireframe: PartnerDetailsWireframeProtocol?
    
    var datasource = [PartnerListModel]()
    var model: PartnerDetailsModel?
    
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
            self.model = model
            //MARK: Brands
            let brandsListModelItem = PartnerListModel(card: nil, brands: model.partner?.brands ?? [], featuredBanner: nil, banners: [], itemType: .brand)
            self.datasource.append(brandsListModelItem)
            
            //MARK: Cards
            let templates = model.partner?.card_templates ?? []
            for i in 0..<templates.count {
                let template = templates[i]
                let enhancedTemplate = EnhancedCardTemplate(template: template, isLast: i == templates.count - 1)
                let cardsListModelItem = PartnerListModel(card: enhancedTemplate, brands: [], featuredBanner: nil, banners: [], itemType: .card)
                self.datasource.append(cardsListModelItem)
            }
            let optionsListModelItem = PartnerListModel(card: nil, brands: [], featuredBanner: nil, banners: [], itemType: .options)
            self.datasource.append(optionsListModelItem)
            
            //MARK: Poster
            let banners = model.banners ?? []
            let posterBannerCollection = banners.filter { ($0.is_featured ?? 0) == 1 }
            
            if !posterBannerCollection.isEmpty {
                let posterListModelItem = PartnerListModel(card: nil, brands: [], featuredBanner: posterBannerCollection.first, banners: [], itemType: .poster)
                self.datasource.append(posterListModelItem)
            }
            
            //MARK: Promotion
            let promotionBannerCollection = banners.filter { ($0.is_featured ?? 0) == 0 }
            if !promotionBannerCollection.isEmpty {
                let promotionListModelItem = PartnerListModel(card: nil, brands: [], featuredBanner: nil, banners: promotionBannerCollection, itemType: .promotion)
                self.datasource.append(promotionListModelItem)
            }
            
            //MARK: Custom link
            if !(model.external_link ?? "").isEmpty && !(model.external_link_label ?? "").isEmpty {
                let customLink = CustomLink(title: model.external_link_label ?? "", link: model.external_link ?? "")
                let customLinkListModelItem = PartnerListModel(card: nil, brands: [], featuredBanner: nil, banners: [], customLink: customLink, itemType: .link)
                self.datasource.append(customLinkListModelItem)
            }
            self.view?.setFavoriteIconWith(icon: (model.user_favorite?.is_favorite ?? 0) == 1 ? AssetTitles.favoriteRoundedSelectedIcon : AssetTitles.favoriteRoundedIcon)
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
            cell.configureWith(card: self.datasource[indexPath.row].card, index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .options {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsOptionsCell.rawValue, for: indexPath) as! PartnerDetailsOptionsTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .poster {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homePosterCell.rawValue, for: indexPath) as! HomePosterCategoryTableViewCell
            cell.configureWith(item: self.datasource[indexPath.row].featuredBanner, index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .promotion {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsPromotionTableCell.rawValue, for: indexPath) as! PartnerDetailsPromotionTableViewCell
            cell.configureWith(datasource: self.datasource[indexPath.row].banners ?? [], index: indexPath, delegate: self)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerDetailsCustomCell.rawValue, for: indexPath) as! PartnerDetailsCustomTableViewCell
            cell.configureWith(item: self.datasource[indexPath.row].customLink, index: indexPath, delegate: self)
            return cell
        }
    }
    
    //MARK: CardTemplate Delegate
    func didSelectCardTemplateItemAt(index: IndexPath){
        let item = self.datasource[index.row]
        wireframe?.toPartnerCardWith(card: item.card?.template)
    }
    
    //MARK: Options Delegate
    func didTapLocations(){
        wireframe?.toLocations(partner: self.model?.partner)
    }
    
    func didTapAbout(){
        
    }
    
    func didTapRules(){
        
    }
    
    //MARK: Promotions Delegate
    func didTapSeeMoreFromPartnerDetailsCellCategory() {
        
    }
    
    func didTapBannerWith(banner: Banner?) {
    }
    
    //MARK: CustomCell Delegate
    func didTapCustomLinkWith(link: String){
        wireframe?.openLinkWith(link: link, delegate: self)
    }
}
