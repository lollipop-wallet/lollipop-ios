//
//  NewLoyaltyCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import CropViewController

class NewLoyaltyCardWireframe: NewLoyaltyCardWireframeProtocol {
    
    static var card: Card?
    static var barcode: String?
    static var isFromTemplate: Bool?
    static var delegate: NewLoyaltyCardControllerProtocol?
    
    static func createModule(NewLoyaltyCardRef: NewLoyaltyCardView) {
        let presenter: NewLoyaltyCardPresenterProtocol & NewLoyaltyCardOutputInteractorProtocol = NewLoyaltyCardPresenter()
        NewLoyaltyCardRef.presenter = presenter
        NewLoyaltyCardRef.presenter?.wireframe = NewLoyaltyCardWireframe()
        NewLoyaltyCardRef.presenter?.view = NewLoyaltyCardRef
        NewLoyaltyCardRef.presenter?.interactor = NewLoyaltyCardInteractor()
        NewLoyaltyCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
    
    func toCropViewControllerWith(image: UIImage, delegate: CropViewControllerDelegate){
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = delegate
        let nav = UINavigationController(rootViewController: cropViewController)
        UIApplication.topViewController()?.present(nav, animated: true, completion: nil)
    }
}
