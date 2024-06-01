//
//  DisplayCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DisplayCardWireframe: DisplayCardWireframeProtocol {
    
    static var card: Card?
    
    static func createModule(DisplayCardRef: DisplayCardView) {
        let presenter: DisplayCardPresenterProtocol & DisplayCardOutputInteractorProtocol = DisplayCardPresenter()
        DisplayCardRef.presenter = presenter
        DisplayCardRef.presenter?.wireframe = DisplayCardWireframe()
        DisplayCardRef.presenter?.view = DisplayCardRef
        DisplayCardRef.presenter?.interactor = DisplayCardInteractor()
        DisplayCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toCardDetails(card: Card?, delegate: CardDetailsControllerProtocol?){
        let vc = CardDetailsView()
        CardDetailsWireframe.card = card
        CardDetailsWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
