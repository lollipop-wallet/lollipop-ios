//
//  CardDetailsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class CardDetailsWireframe: CardDetailsWireframeProtocol {
    
    
    static func createModule(CardDetailsRef: CardDetailsView) {
        let presenter: CardDetailsPresenterProtocol & CardDetailsOutputInteractorProtocol = CardDetailsPresenter()
        CardDetailsRef.presenter = presenter
        CardDetailsRef.presenter?.wireframe = CardDetailsWireframe()
        CardDetailsRef.presenter?.view = CardDetailsRef
        CardDetailsRef.presenter?.interactor = CardDetailsInteractor()
        CardDetailsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toEdit(){
        let vc = EditCardView()
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
