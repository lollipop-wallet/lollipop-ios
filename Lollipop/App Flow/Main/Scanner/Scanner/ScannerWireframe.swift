//
//  ScannerWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ScannerWireframe: ScannerWireframeProtocol {
    
    static var card: Card?
    
    static func createModule(ScannerRef: ScannerView) {
        let presenter: ScannerPresenterProtocol & ScannerOutputInteractorProtocol = ScannerPresenter()
        ScannerRef.presenter = presenter
        ScannerRef.presenter?.wireframe = ScannerWireframe()
        ScannerRef.presenter?.view = ScannerRef
        ScannerRef.presenter?.interactor = ScannerInteractor()
        ScannerRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toNewCardWith(card: Card?, barcode: String){
        let vc = NewLoyaltyCardView()
        NewLoyaltyCardWireframe.card = card
        NewLoyaltyCardWireframe.barcode = barcode
        NewLoyaltyCardWireframe.isFromTemplate = true
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
