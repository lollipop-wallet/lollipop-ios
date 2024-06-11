//
//  PartnerCardSignupPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire
import SafariServices

class PartnerCardSignupPresenter: NSObject, PartnerCardSignupPresenterProtocol  {
    
    var interactor : PartnerCardSignupInputInteractorProtocol?
    weak var view: PartnerCardSignupViewProtocol?
    var wireframe: PartnerCardSignupWireframeProtocol?
    
    var card: Card?
    var termsOn = Bool()
    
    func viewDidLoad() {
        self.termsOn = false
        interactor?.viewDidLoad()
    }
    
    func handleDropDownTap(item: CountryCode){
        self.view?.setFlagWith(flag: item.flag ?? "")
        self.view?.setPrefixWith(prefix: "+\(item.phone_code ?? "")")
    }
    
    func handleCityDropdownTapWith(item: String){
        view?.setCityWith(item: item)
    }
    
    func onTermsCheckTap(){
        termsOn = !termsOn
        self.view?.setTermsCheckWith(isOn: self.termsOn)
    }
    
    func send(name: String, city: String, prefix: String, phone: String, email: String){
        if !termsOn {
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.termsMessage.localized, shouldDismiss: false)
            return
        }
        guard !name.isEmpty, !city.isEmpty, !phone.isEmpty, !email.isEmpty else {
            view?.validate(isNameEmpty: name.isEmpty, isCityEmpty: city == LocalizedTitle.choose.localized, isPhoneEmpty: phone.isEmpty, isEmailEmpty: email.isEmpty)
            return
        }
        let phone = prefix + phone
        interactor?.inquiry(name: name, city: city, phone: phone, partnerAlias: self.card?.partner?.alias ?? "", email: email)
    }
    
    func openTermsAndConditions() {
        wireframe?.openLink(link: self.card?.card_template?.terms_conditions_url ?? "", delegate: self)
    }
}

extension PartnerCardSignupPresenter: PartnerCardSignupOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
    }
    
    func parseInquiryData(result: Result<PartnerCardSignupModel, AFError>){
        switch result {
        case .success(let model):
            wireframe?.toDialogue(delegate: self)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: Dropdown field delegate
extension PartnerCardSignupPresenter {
    func showHideDropdown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dropdown delegate
extension PartnerCardSignupPresenter {
    func dropDownHidden(tag: Int) {
        view?.hideDropdownWith(tag: tag)
    }
    
    func dropDownShown(tag: Int) {
        view?.showDropdownWith(tag: tag)
    }
}

//MARK: Dialogue controler delegate
extension PartnerCardSignupPresenter {
    
}
