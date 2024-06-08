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
        print("Aco1")
        let delegate = ProfileWireframe.delegate
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.getprofile { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else {return}
            self.presenter?.parseUserData(result: result, delegate: delegate)
        }
    }
    
    func updateAvatar(avatar: Data){
        UIApplication.root().view.showSpinner()
        APIClient.updateavatar(avatar: avatar) { [weak self] result in
            UIApplication.root().view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseUpdatedAvatarData(result: result)
        }
    }
}
