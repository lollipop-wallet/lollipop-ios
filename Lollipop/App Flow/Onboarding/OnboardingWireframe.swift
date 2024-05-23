//
//  OnboardingWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OnboardingWireframe: OnboardingWireframeProtocol {
    
    
    static func createModule(OnboardingRef: OnboardingView) {
        let presenter: OnboardingPresenterProtocol & OnboardingOutputInteractorProtocol = OnboardingPresenter()
        OnboardingRef.presenter = presenter
        OnboardingRef.presenter?.wireframe = OnboardingWireframe()
        OnboardingRef.presenter?.view = OnboardingRef
        OnboardingRef.presenter?.interactor = OnboardingInteractor()
        OnboardingRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
