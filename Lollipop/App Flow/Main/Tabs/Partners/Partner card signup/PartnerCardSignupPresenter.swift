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
    
}

extension PartnerCardSignupPresenter: PartnerCardSignupOutputInteractorProtocol {
    
}

//MARK: Input field protocols
extension PartnerCardSignupPresenter {
    func showDropdown() {
        view?.setupAndOpenPhonePrefixDropdown()
    }
}
