//
//  LaunchInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LaunchInteractor: LaunchInputInteractorProtocol {
    
    weak var presenter: LaunchOutputInteractorProtocol?
    
    func getConfig(){
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getconfig { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseConfigData(result: result)
        }
    }
}
