//
//  DialogueInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DialogueInteractor: DialogueInputInteractorProtocol {
    
    weak var presenter: DialogueOutputInteractorProtocol?
    
    func viewDidLoad() {
        let icon = DialogueWireframe.icon ?? ""
        let title = DialogueWireframe.title ?? ""
        let subtitle = DialogueWireframe.subtitle ?? ""
        let buttonTitle = DialogueWireframe.buttonTitle ?? ""
        let type = DialogueWireframe.type
        let popAmount = DialogueWireframe.popAmount ?? 0
        let delegate = DialogueWireframe.delegate
        
        presenter?.takeDataWith(icon: icon, title: title, subtitle: subtitle, buttonTitle: buttonTitle, type: type, popAmount: popAmount, delegate: delegate)
    }
}
