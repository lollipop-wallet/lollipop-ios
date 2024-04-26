//
//  LaunchWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LaunchWireframe: LaunchWireframeProtocol {
    
    
    static func createModule(LaunchRef: LaunchView) {
        let presenter: LaunchPresenterProtocol & LaunchOutputInteractorProtocol = LaunchPresenter()
        LaunchRef.presenter = presenter
        LaunchRef.presenter?.wireframe = LaunchWireframe()
        LaunchRef.presenter?.view = LaunchRef
        LaunchRef.presenter?.interactor = LaunchInteractor()
        LaunchRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    func toOnboarding() {
        let vc = OnboardingView()
        let navigationController = UINavigationController(rootViewController: vc)
        //navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
