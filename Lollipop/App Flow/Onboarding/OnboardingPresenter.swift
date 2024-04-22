//
//  OnboardingPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 22/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OnboardingPresenter: OnboardingPresenterProtocol  {
    
    var interactor : OnboardingInputInteractorProtocol?
    weak var view: OnboardingViewProtocol?
    var wireframe: OnboardingWireframeProtocol?
    
}

extension OnboardingPresenter: OnboardingOutputInteractorProtocol {
    
}
