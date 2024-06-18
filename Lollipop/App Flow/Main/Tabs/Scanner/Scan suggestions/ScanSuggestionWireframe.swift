//
//  ScanSuggestionWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ScanSuggestionWireframe: ScanSuggestionWireframeProtocol {
    
    
    static func createModule(ScanSuggestionRef: ScanSuggestionView) {
        let presenter: ScanSuggestionPresenterProtocol & ScanSuggestionOutputInteractorProtocol = ScanSuggestionPresenter()
        ScanSuggestionRef.presenter = presenter
        ScanSuggestionRef.presenter?.wireframe = ScanSuggestionWireframe()
        ScanSuggestionRef.presenter?.view = ScanSuggestionRef
        ScanSuggestionRef.presenter?.interactor = ScanSuggestionInteractor()
        ScanSuggestionRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toScannerWith(card: Card?){
        let vc = ScannerView()
        ScannerWireframe.card = card
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toNewCard(){
        let vc = NewLoyaltyCardView()
        NewLoyaltyCardWireframe.isFromTemplate = false
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
