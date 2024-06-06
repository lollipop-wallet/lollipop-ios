//
//  ProfileSettingsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfileSettingsWireframe: ProfileSettingsWireframeProtocol {
    
    
    static func createModule(ProfileSettingsRef: ProfileSettingsView) {
        let presenter: ProfileSettingsPresenterProtocol & ProfileSettingsOutputInteractorProtocol = ProfileSettingsPresenter()
        ProfileSettingsRef.presenter = presenter
        ProfileSettingsRef.presenter?.wireframe = ProfileSettingsWireframe()
        ProfileSettingsRef.presenter?.view = ProfileSettingsRef
        ProfileSettingsRef.presenter?.interactor = ProfileSettingsInteractor()
        ProfileSettingsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPersonalData(){
        let vc = PersonalDataView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toChangePassword(){
        let vc = ChangePasswordView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toAccountDeletion() {
        let vc = AccountDeletionView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toLanguage(){
        let vc = LanguageView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
