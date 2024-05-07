//
//  NewLoyaltyCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewLoyaltyCardWireframe: NewLoyaltyCardWireframeProtocol {
    
    
    static func createModule(NewLoyaltyCardRef: NewLoyaltyCardView) {
        let presenter: NewLoyaltyCardPresenterProtocol & NewLoyaltyCardOutputInteractorProtocol = NewLoyaltyCardPresenter()
        NewLoyaltyCardRef.presenter = presenter
        NewLoyaltyCardRef.presenter?.wireframe = NewLoyaltyCardWireframe()
        NewLoyaltyCardRef.presenter?.view = NewLoyaltyCardRef
        NewLoyaltyCardRef.presenter?.interactor = NewLoyaltyCardInteractor()
        NewLoyaltyCardRef.presenter?.interactor?.presenter = presenter
        
    }
}
