//
//  NewPartnerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPartnerPresenter: NSObject, NewPartnerPresenterProtocol  {
    
    var interactor : NewPartnerInputInteractorProtocol?
    weak var view: NewPartnerViewProtocol?
    var wireframe: NewPartnerWireframeProtocol?
}

extension NewPartnerPresenter: NewPartnerOutputInteractorProtocol {
    
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
