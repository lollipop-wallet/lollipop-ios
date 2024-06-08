//
//  AccountDeletionWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class AccountDeletionWireframe: AccountDeletionWireframeProtocol {
    
    static func createModule(AccountDeletionRef: AccountDeletionView) {
        let presenter: AccountDeletionPresenterProtocol & AccountDeletionOutputInteractorProtocol = AccountDeletionPresenter()
        AccountDeletionRef.presenter = presenter
        AccountDeletionRef.presenter?.wireframe = AccountDeletionWireframe()
        AccountDeletionRef.presenter?.view = AccountDeletionRef
        AccountDeletionRef.presenter?.interactor = AccountDeletionInteractor()
        AccountDeletionRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}


