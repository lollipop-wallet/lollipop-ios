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
    func takeDataWith(icon: String, title:  String, subtitle: String, type: DialogueType?, delegate: DialogueControllerProtocol?){
        self.type = type
        self.delegate = delegate
    }
}
