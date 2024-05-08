//
//  WalletCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletCardWireframe: WalletCardWireframeProtocol {
    
    
    static func createModule(WalletCardRef: WalletCardView) {
        let presenter: WalletCardPresenterProtocol & WalletCardOutputInteractorProtocol = WalletCardPresenter()
        WalletCardRef.presenter = presenter
        WalletCardRef.presenter?.wireframe = WalletCardWireframe()
        WalletCardRef.presenter?.view = WalletCardRef
        WalletCardRef.presenter?.interactor = WalletCardInteractor()
        WalletCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toLocations() {
        let vc = LocationsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
