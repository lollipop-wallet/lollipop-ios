//
//  PartnerCardSignupPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardSignupPresenter: NSObject, PartnerCardSignupPresenterProtocol  {
    
    var interactor : PartnerCardSignupInputInteractorProtocol?
    weak var view: PartnerCardSignupViewProtocol?
    var wireframe: PartnerCardSignupWireframeProtocol?
    
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func handleDropDownTap(item: CountryCode){
        self.view?.setFlagWith(flag: item.flag ?? "")
        self.view?.setPrefixWith(prefix: "+\(item.phone_code ?? "")")
    }
}

extension PartnerCardSignupPresenter: PartnerCardSignupOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
    }
}

//MARK: Input field protocols
extension PartnerCardSignupPresenter {
    func showHideDropdown(tag: Int) {
        view?.setupAndOpenPhonePrefixDropdown()
    }
}


//MARK: Dropdown protocol
extension PartnerCardSignupPresenter {
    func dropDownHidden(tag: Int) {
        view?.hidePrefixDropdown()
    }
    
    func dropDownShown(tag: Int) {
        view?.setupAndOpenPhonePrefixDropdown()
    }
}
