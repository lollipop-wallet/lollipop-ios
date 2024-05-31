//
//  EditCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class EditCardPresenter: EditCardPresenterProtocol  {
    
    var interactor : EditCardInputInteractorProtocol?
    weak var view: EditCardViewProtocol?
    var wireframe: EditCardWireframeProtocol?
    
    var delegate: EditCardControllerProtocol?
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func delete(){
        wireframe?.toDelete()
    }
}

extension EditCardPresenter: EditCardOutputInteractorProtocol {
    func takeData(card: Card?, delegate: EditCardControllerProtocol?){
        self.card = card
        self.delegate = delegate
        self.view?.setFrontCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_front ?? "" : card?.front_image ?? "")
        self.view?.setBackCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_back ?? "" : card?.back_image ?? "")
        self.view?.setCardNameWith(name: card?.name ?? "")
        self.view?.setCardNumberWith(number: card?.cardNumber ?? "")
        self.view?.setBarcodeWith(barcode: card?.code ?? "")
        self.view?.setNameOnTheCardWith(nameOnTheCard: card?.name_on_card ?? "")
        self.view?.setNotesWith(notes: card?.notes ?? "")
    }
}
