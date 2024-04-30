//
//  DialogueWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DialogueWireframe: DialogueWireframeProtocol {
    
    static var icon: String? { get set }
    static var title: String? { get set }
    static var subtitle: String? { get set }
    static var type: DialogueType? { get set }
    static var delegate: DialogueControllerProtocol? { get set }
    
    static func createModule(DialogueRef: DialogueView) {
        let presenter: DialoguePresenterProtocol & DialogueOutputInteractorProtocol = DialoguePresenter()
        DialogueRef.presenter = presenter
        DialogueRef.presenter?.wireframe = DialogueWireframe()
        DialogueRef.presenter?.view = DialogueRef
        DialogueRef.presenter?.interactor = DialogueInteractor()
        DialogueRef.presenter?.interactor?.presenter = presenter
        
    }
}
