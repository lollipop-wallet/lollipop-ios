//
//  HomePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class HomePresenter: NSObject, HomePresenterProtocol  {
    
    var interactor : HomeInputInteractorProtocol?
    weak var view: HomeViewProtocol?
    var wireframe: HomeWireframeProtocol?
    var delegate: HomeControllerProtocol?
    
    var datasource = [HomeListModel]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension HomePresenter: HomeOutputInteractorProtocol {
    func parseHomeData(result: Result<HomeModel, AFError>, delegate: HomeControllerProtocol?){
        self.delegate = delegate
        switch result {
        case .success(let model):
            if !(model.cards ?? []).isEmpty {
                let homeItem = HomeListModel(cards: model.cards ?? [], brands: [], featuredBanner: nil, banners: [], itemType: .cards)
                self.datasource.append(homeItem)
            }else{
                let homeItem = HomeListModel(cards: [], brands: [], featuredBanner: nil, banners: [], itemType: .addcard)
                self.datasource.append(homeItem)
            }
            
            if !(model.brands ?? []).isEmpty {
                let homeItem = HomeListModel(cards: [], brands: model.brands, featuredBanner: nil, banners: [], itemType: .brand)
                self.datasource.append(homeItem)
            }
            let elements = model.elements ?? []
            for i in 0..<elements.count {
                let element = elements[i]
                if element.featured_banner != nil {
                    var featuredBanner = element.featured_banner
                    if !(element.title ?? "").isEmpty {
                        featuredBanner?.title = element.title ?? ""
                    }
                    if !(element.featured_image ?? "").isEmpty {
                        featuredBanner?.featured_image = element.featured_image
                    }
                    let homeItem = HomeListModel(cards: [], brands: [], featuredBanner: featuredBanner, banners: [], itemType: .poster)
                    self.datasource.append(homeItem)
                }
                if !(element.banners ?? []).isEmpty {
                    let homeItem = HomeListModel(cards: [], brands: [], featuredBanner: nil, banners: element.banners ?? [], itemType: .promotion)
                    self.datasource.append(homeItem)
                }
            }
            self.view?.reload()
            self.view?.setUserNameWith(name: (model.user?.name ?? "").isEmpty ? LocalizedTitle.signIn.localized : model.user?.name ?? "")
            if !(model.user?.avatar ?? "").isEmpty{
                self.view?.setUserAvatarWith(avatar: model.user?.avatar ?? "")
            }
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

extension HomePresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.datasource[indexPath.row].itemType == .cards {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCardCell.rawValue, for: indexPath) as! HomeCardTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .addcard {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.addCardHomeCell.rawValue, for: indexPath) as! AddCardHomeTableViewCell
            cell.configureWith(index: indexPath, delegate: self)
            return cell
        }
        else if self.datasource[indexPath.row].itemType == .brand {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeCircleHorizontalCell.rawValue, for: indexPath) as! HomeCircleHorizontalCategoryTableViewCell
            cell.configureWith(brands: self.datasource[indexPath.row].brands ?? [], sectionTitle: LocalizedTitle.ourPartners.localized ,index: indexPath, delegate: self)
            return cell
        }else if self.datasource[indexPath.row].itemType == .poster {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homePosterCell.rawValue, for: indexPath) as! HomePosterCategoryTableViewCell
            cell.configureWith(item: self.datasource[indexPath.row].featuredBanner, index: indexPath, delegate: self)
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CellId.homeRectItemCell.rawValue, for: indexPath) as! HomeRectHorizontalCategoryTableViewCell
            cell.configureWith(datasource: self.datasource[indexPath.row].banners ?? [], index: indexPath, delegate: self)
            return cell
        }
    }
    
    func didTapAddCard() {
        
    }
    
    func didTapSeeMoreFromCircleCategory(){
        delegate?.toPartnersTab()
    }
    
    func didTapSeeMoreFromRectCategory(){
        wireframe?.toPromotions()
    }
}
