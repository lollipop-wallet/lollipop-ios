//
//  NewPartnerWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewPartnerWireframe: NewPartnerWireframeProtocol {
    
    
    static func createModule(NewPartnerRef: NewPartnerView) {
        let presenter: NewPartnerPresenterProtocol & NewPartnerOutputInteractorProtocol = NewPartnerPresenter()
        NewPartnerRef.presenter = presenter
        NewPartnerRef.presenter?.wireframe = NewPartnerWireframe()
        NewPartnerRef.presenter?.view = NewPartnerRef
        NewPartnerRef.presenter?.interactor = NewPartnerInteractor()
        NewPartnerRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDialogue(delegate: DialogueControllerProtocol?){
        let vc = DialogueView()
        DialogueWireframe.type = .dismissive
        DialogueWireframe.buttonTitle = LocalizedTitle.ok.localized
        DialogueWireframe.title = LocalizedTitle.thanksForSuggestionTitle.localized
        DialogueWireframe.subtitle = LocalizedTitle.thanksForSuggestionSubtitle.localized
        DialogueWireframe.icon = AssetTitles.illustrationSuccessIcon
        DialogueWireframe.popAmount = 3
        DialogueWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
}
