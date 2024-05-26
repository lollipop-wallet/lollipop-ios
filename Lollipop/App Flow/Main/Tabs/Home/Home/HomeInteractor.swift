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
    
    func viewDidLoad() {
        let delegate = HomeWireframe.delegate
        
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.gethome { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseHomeData(result: result, delegate: delegate)
        }
    }
}
