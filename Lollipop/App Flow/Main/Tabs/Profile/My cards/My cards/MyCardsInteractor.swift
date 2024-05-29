//
//  MyCardsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class MyCardsInteractor: MyCardsInputInteractorProtocol {
    
    weak var presenter: MyCardsOutputInteractorProtocol?
    
    func viewDidLoad() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getusercards { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseCardsData(result: result)
        }
    }
}
