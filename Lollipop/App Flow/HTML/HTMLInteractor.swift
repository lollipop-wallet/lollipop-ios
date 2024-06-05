//
//  HTMLInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class HTMLInteractor: HTMLInputInteractorProtocol {
    
    weak var presenter: HTMLOutputInteractorProtocol?
    
    func viewDidLoad() {
        let title = HTMLWireframe.title ?? ""
        let description = HTMLWireframe.description ?? ""
        let buttonTitle = HTMLWireframe.buttonTitle ?? ""
        let link = HTMLWireframe.externalLink ?? ""
        presenter?.takeData(title: title, description: description, buttonTitle: buttonTitle, externalLink: link)
    }
}
