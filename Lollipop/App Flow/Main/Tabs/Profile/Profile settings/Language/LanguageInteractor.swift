//
//  LanguageInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LanguageInteractor: LanguageInputInteractorProtocol {
    
    weak var presenter: LanguageOutputInteractorProtocol?
    
    func updateLanWith(languageId: Int) {
        UIApplication.topViewController()?.view?.showSpinner()
        APIClient.updatelanguage(languageId: languageId) { [weak self] result in
            UIApplication.topViewController()?.view?.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseUpdatedLanguageData(result: result)
        }
    }
}
