//
//  PromotionsInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class PromotionsInteractor: PromotionsInputInteractorProtocol {
    
    weak var presenter: PromotionsOutputInteractorProtocol?
    
    func viewDidLoad() {
        let partnerAlias = PromotionsWireframe.partnerAlias ?? ""
        presenter?.takeData(partnerAlias: partnerAlias)
    }
    
    func getPromotions(){
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getpromotions { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parsePromotionsData(result: result)
        }
    }
}
