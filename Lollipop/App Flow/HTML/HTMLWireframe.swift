//
//  HTMLWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SafariServices

class HTMLWireframe: HTMLWireframeProtocol {
    
    static var title: String?
    static var description: String?
    static var buttonTitle: String?
    static var externalLink: String? 
    
    static func createModule(HTMLRef: HTMLView) {
        let presenter: HTMLPresenterProtocol & HTMLOutputInteractorProtocol = HTMLPresenter()
        HTMLRef.presenter = presenter
        HTMLRef.presenter?.wireframe = HTMLWireframe()
        HTMLRef.presenter?.view = HTMLRef
        HTMLRef.presenter?.interactor = HTMLInteractor()
        HTMLRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func openExternalLinkWith(link: String, delegate: SFSafariViewControllerDelegate){
        let url = URL(string: link)!
        let controller = SFSafariViewController(url: url)
        controller.delegate = delegate
        UIApplication.topViewController()?.present(controller, animated: true)
    }
}
