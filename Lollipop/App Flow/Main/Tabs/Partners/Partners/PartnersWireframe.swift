//
//  PartnersWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnersWireframe: PartnersWireframeProtocol {
    
    static var delegate: PartnersControllerProtocol?
    
    static func createModule(PartnersRef: PartnersView) {
        let presenter: PartnersPresenterProtocol & PartnersOutputInteractorProtocol = PartnersPresenter()
        PartnersRef.presenter = presenter
        PartnersRef.presenter?.wireframe = PartnersWireframe()
        PartnersRef.presenter?.view = PartnersRef
        PartnersRef.presenter?.interactor = PartnersInteractor()
        PartnersRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toNewPartner() {
        let vc = NewPartnerView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toPartnerDetails(alias: String){
        let vc = PartnerDetailsView()
        PartnerDetailsWireframe.alias = alias
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toMyShops(delegate: MyShopsControllerProtocol?){
        let vc = MyShopsView()
        MyShopsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
