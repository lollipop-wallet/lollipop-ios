//
//  LaunchPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class LaunchPresenter: LaunchPresenterProtocol  {
    
    var interactor : LaunchInputInteractorProtocol?
    weak var view: LaunchViewProtocol?
    var wireframe: LaunchWireframeProtocol?
    
    func viewDidLoad(){
        if UserDefaults.standard.value(forKey: StorageKeys.onboarding.rawValue) != nil {
            wireframe?.toMain()
        }else{
            StorageManager().onboarding()
            wireframe?.toOnboarding()
        }
    }
}

extension LaunchPresenter: LaunchOutputInteractorProtocol {
    
}
