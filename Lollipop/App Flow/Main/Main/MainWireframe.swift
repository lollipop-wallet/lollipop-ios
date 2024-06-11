//
//  MainWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MainWireframe: MainWireframeProtocol {
    
    
    static func createModule(MainRef: MainView) {
        let presenter: MainPresenterProtocol & MainOutputInteractorProtocol = MainPresenter()
        MainRef.presenter = presenter
        MainRef.presenter?.wireframe = MainWireframe()
        MainRef.presenter?.view = MainRef
        MainRef.presenter?.interactor = MainInteractor()
        MainRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toWalletWith(cards: [Card]){
//        let vc = WalletView()
//        WalletWireframe.cards = cards
//        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
        
        let vc = OTPView()
//        OTPWireframe.id = id
//        OTPWireframe.email = email
//        OTPWireframe.otpType = .registration
        let navVC = UINavigationController(rootViewController: vc)
        UIApplication.topViewController()?.present(navVC, animated: true)
    }
}
