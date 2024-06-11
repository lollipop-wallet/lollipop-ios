//
//  LanguageWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LanguageWireframe: LanguageWireframeProtocol {
    
    
    static func createModule(LanguageRef: LanguageView) {
        let presenter: LanguagePresenterProtocol & LanguageOutputInteractorProtocol = LanguagePresenter()
        LanguageRef.presenter = presenter
        LanguageRef.presenter?.wireframe = LanguageWireframe()
        LanguageRef.presenter?.view = LanguageRef
        LanguageRef.presenter?.interactor = LanguageInteractor()
        LanguageRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
}
