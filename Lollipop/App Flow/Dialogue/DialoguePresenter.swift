//
//  DialoguePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DialoguePresenter: DialoguePresenterProtocol  {
    
    var interactor : DialogueInputInteractorProtocol?
    weak var view: DialogueViewProtocol?
    var wireframe: DialogueWireframeProtocol?
    
    var type: DialogueType?
    var delegate: DialogueControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension DialoguePresenter: DialogueOutputInteractorProtocol {
    func takeDataWith(icon: String, title:  String, subtitle: String, buttonTitle: String?, type: DialogueType?, delegate: DialogueControllerProtocol?){
        self.type = type
        self.delegate = delegate
        self.view?.setIconWith(icon: icon)
        self.view?.setTitleWith(title: title)
        self.view?.setSubtitleWith(subtitle: subtitle)
        self.view?.setButtonTitleWith(buttonTitle: buttonTitle)
    }
}
