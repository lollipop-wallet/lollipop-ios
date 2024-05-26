//
//  HomeWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class HomeWireframe: HomeWireframeProtocol {
    
    static var delegate: HomeControllerProtocol?
    
    static func createModule(HomeRef: HomeView) {
        let presenter: HomePresenterProtocol & HomeOutputInteractorProtocol = HomePresenter()
        HomeRef.presenter = presenter
        HomeRef.presenter?.wireframe = HomeWireframe()
        HomeRef.presenter?.view = HomeRef
        HomeRef.presenter?.interactor = HomeInteractor()
        HomeRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toPromotions(){
        let vc = PromotionsView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
