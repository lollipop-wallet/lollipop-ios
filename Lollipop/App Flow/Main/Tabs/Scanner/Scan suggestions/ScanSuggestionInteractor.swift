//
//  ScanSuggestionInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ScanSuggestionInteractor: ScanSuggestionInputInteractorProtocol {
    
    weak var presenter: ScanSuggestionOutputInteractorProtocol?
    
    func viewDidLoad() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getcardtemplates { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseCardsData(result: result)
        }
    }
}
