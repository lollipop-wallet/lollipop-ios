//
//  ProfileWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfileWireframe: ProfileWireframeProtocol {
    
    static var delegate: ProfileControllerProtocol?
    
    static func createModule(ProfileRef: ProfileView) {
        let presenter: ProfilePresenterProtocol & ProfileOutputInteractorProtocol = ProfilePresenter()
        ProfileRef.presenter = presenter
        ProfileRef.presenter?.wireframe = ProfileWireframe()
        ProfileRef.presenter?.view = ProfileRef
        ProfileRef.presenter?.interactor = ProfileInteractor()
        ProfileRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPersonalData(model: ProfileModel?){
        let vc = ProfileSettingsView()
        ProfileSettingsWireframe.model = model
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMyCards(delegage: MyCardsControllerProtocol?){
        let vc = MyCardsView()
        MyCardsWireframe.delegate = delegage
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toAbout(){
        let vc = AboutView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toTerms(){
        let vc = TermsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMyShops(){
        let vc = MyShopsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
