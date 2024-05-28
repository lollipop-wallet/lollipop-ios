//
//  NewPartnerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class NewPartnerPresenter: NSObject, NewPartnerPresenterProtocol  {
    
    var interactor : NewPartnerInputInteractorProtocol?
    weak var view: NewPartnerViewProtocol?
    var wireframe: NewPartnerWireframeProtocol?
    
    func handleCityDropdownTapWith(item: String){
        view?.setCityWith(item: item)
    }
    
    func send(shopName: String, city: String, address: String, note: String){
        guard !shopName.isEmpty else {
            view?.validate(isShopNameEmpty: shopName.isEmpty)
            return
        }
        interactor?.send(shopName: shopName, country: "Montenegro", city: city, address: address, note: note)
    }
}

extension NewPartnerPresenter: NewPartnerOutputInteractorProtocol {
    func parseSuggestionResult(result: Result<NewPartnerModel, AFError>){
        switch result {
        case .success(let model):
            wireframe?.toDialogue(delegate: self)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: Dropdown field delegate
extension NewPartnerPresenter {
    func showHideDropdown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dropdown delegate
extension NewPartnerPresenter {
    func dropDownHidden(tag: Int) {
        view?.hideDropdownWith(tag: tag)
    }
    
    func dropDownShown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dialogue controler delegate
extension NewPartnerPresenter {
    
}
