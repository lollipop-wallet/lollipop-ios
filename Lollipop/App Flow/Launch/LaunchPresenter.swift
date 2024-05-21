//
//  LaunchPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class LaunchPresenter: LaunchPresenterProtocol  {
    
    var interactor : LaunchInputInteractorProtocol?
    weak var view: LaunchViewProtocol?
    var wireframe: LaunchWireframeProtocol?
    
    func viewDidLoad(){
        interactor?.getConfig()
    }
}

extension LaunchPresenter: LaunchOutputInteractorProtocol {
    func parseConfigData(result: Result<ConfigModel, AFError>){
        switch result {
        case .success(let model):
            Config.model = model
            if UserDefaults.standard.value(forKey: StorageKeys.onboarding.rawValue) != nil {
                wireframe?.toMain()
            }else{
                StorageManager().onboarding()
                wireframe?.toOnboarding()
            }
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
