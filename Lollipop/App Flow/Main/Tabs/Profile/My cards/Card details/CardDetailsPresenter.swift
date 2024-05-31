//
//  CardDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class CardDetailsPresenter: CardDetailsPresenterProtocol  {
    
    var interactor : CardDetailsInputInteractorProtocol?
    weak var view: CardDetailsViewProtocol?
    var wireframe: CardDetailsWireframeProtocol?
    
    var card: Card?
    var delegate: CardDetailsControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func edit() {
        wireframe?.toEdit()
    }
}

extension CardDetailsPresenter: CardDetailsOutputInteractorProtocol {
    func takeData(card: Card?, delegate: CardDetailsControllerProtocol?){
        self.card = card
        self.delegate = delegate
    }
}


