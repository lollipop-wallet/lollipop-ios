//
//  PartnerCardSignupWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import SafariServices

class PartnerCardSignupWireframe: PartnerCardSignupWireframeProtocol {
    
    static var card: Card?
    
    static func createModule(PartnerCardSignupRef: PartnerCardSignupView) {
        let presenter: PartnerCardSignupPresenterProtocol & PartnerCardSignupOutputInteractorProtocol = PartnerCardSignupPresenter()
        PartnerCardSignupRef.presenter = presenter
        PartnerCardSignupRef.presenter?.wireframe = PartnerCardSignupWireframe()
        PartnerCardSignupRef.presenter?.view = PartnerCardSignupRef
        PartnerCardSignupRef.presenter?.interactor = PartnerCardSignupInteractor()
        PartnerCardSignupRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toDialogue(delegate: DialogueControllerProtocol?){
        let vc = DialogueView()
        DialogueWireframe.type = .dismissive
        DialogueWireframe.buttonTitle = LocalizedTitle.ok.localized
        DialogueWireframe.title = LocalizedTitle.inquiryDialogueTitle.localized
        DialogueWireframe.subtitle = LocalizedTitle.inquiryDialogueSubtitle.localized
        DialogueWireframe.icon = AssetTitles.illustrationSuccessInquiryIcon
        DialogueWireframe.popAmount = 4
        DialogueWireframe.delegate = delegate
        UIApplication.topViewController()?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func openLink(link: String, delegate: SFSafariViewControllerDelegate){
        let url = URL(string: link)!
        let controller = SFSafariViewController(url: url)
        controller.delegate = delegate
        UIApplication.topViewController()?.present(controller, animated: true)
    }
}
