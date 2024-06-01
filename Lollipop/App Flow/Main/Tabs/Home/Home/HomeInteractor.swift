//
//  HomeInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HomeInteractor: HomeInputInteractorProtocol {
    
    weak var presenter: HomeOutputInteractorProtocol?
    
    func viewDidLoad(showSpinner: Bool) {
        let delegate = HomeWireframe.delegate
        if showSpinner {
            UIApplication.topViewController()?.view.showSpinner()
        }
        APIClient.gethome { [weak self] result in
            if showSpinner {
                UIApplication.topViewController()?.view.hideSpinner()
            }
            guard let self = self else {return}
            self.presenter?.parseHomeData(result: result, delegate: delegate)
        }
    }
    
    func getCardDetailsWith(alias: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getcarddetails(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseCardDetailsWith(result: result)
        }
    }
    
    func getWalletCards(){
        
    }
}
