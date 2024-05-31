//
//  ProfileInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class ProfileInteractor: ProfileInputInteractorProtocol {
    
    weak var presenter: ProfileOutputInteractorProtocol?
    
    func viewDidLoad() {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getprofile { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseUserData(result: result)
        }
    }
}
