//
//  EditCardWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import CropViewController

class EditCardWireframe: EditCardWireframeProtocol {
    
    static var card: Card?
    static var delegate: EditCardControllerProtocol?
    
    static func createModule(EditCardRef: EditCardView) {
        let presenter: EditCardPresenterProtocol & EditCardOutputInteractorProtocol = EditCardPresenter()
        EditCardRef.presenter = presenter
        EditCardRef.presenter?.wireframe = EditCardWireframe()
        EditCardRef.presenter?.view = EditCardRef
        EditCardRef.presenter?.interactor = EditCardInteractor()
        EditCardRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDelete(alias: String){
        let vc = DeleteCardView()
        DeleteCardWireframe.alias = alias
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func toCropViewControllerWith(image: UIImage, delegate: CropViewControllerDelegate){
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = delegate
        let nav = UINavigationController(rootViewController: cropViewController)
        UIApplication.topViewController()?.present(nav, animated: true, completion: nil)
    }
}
