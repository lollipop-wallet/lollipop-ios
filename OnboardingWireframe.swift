//
//  OnboardingWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
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
}
