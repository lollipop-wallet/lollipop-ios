//
//  CardDetailsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class CardDetailsWireframe: CardDetailsWireframeProtocol {
    
    static var card: Card?
    static var delegate: CardDetailsControllerProtocol?
    
    static func createModule(CardDetailsRef: CardDetailsView) {
        let presenter: CardDetailsPresenterProtocol & CardDetailsOutputInteractorProtocol = CardDetailsPresenter()
        CardDetailsRef.presenter = presenter
        CardDetailsRef.presenter?.wireframe = CardDetailsWireframe()
        CardDetailsRef.presenter?.view = CardDetailsRef
        CardDetailsRef.presenter?.interactor = CardDetailsInteractor()
        CardDetailsRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toEdit(card: Card?, delegate: EditCardControllerProtocol?){
        let vc = EditCardView()
        EditCardWireframe.card = card
        EditCardWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
