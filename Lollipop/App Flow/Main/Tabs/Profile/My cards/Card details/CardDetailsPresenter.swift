//
//  CardDetailsPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class CardDetailsPresenter: NSObject, CardDetailsPresenterProtocol  {
    
    var interactor : CardDetailsInputInteractorProtocol?
    weak var view: CardDetailsViewProtocol?
    var wireframe: CardDetailsWireframeProtocol?
    
    var card: Card?
    var delegate: CardDetailsControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func edit() {
        wireframe?.toEdit(card: self.card, delegate: self)
    }
}

extension CardDetailsPresenter: CardDetailsOutputInteractorProtocol {
    func takeData(card: Card?, delegate: CardDetailsControllerProtocol?){
        self.card = card
        self.delegate = delegate
        self.view?.setFrontCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_front ?? "" : card?.image_front ?? "")
        self.view?.setBackCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_back ?? "" : card?.image_back ?? "")
        self.view?.setCardNameWith(name: card?.name ?? "")
        self.view?.setCardNameHidden(isHidden: card?.isCardNameHidden ?? false)
        self.view?.setCardNumberWith(number: card?.cardNumber ?? "")
        self.view?.setCardNumberHidden(isHidden: card?.isCardNumberHidden ?? false)
        self.view?.setBarcodeWith(barcode: card?.code ?? "")
        self.view?.setBarcodeHidden(isHidden: card?.isBarcodeHidden ?? false)
        self.view?.setNameOnTheCardWith(nameOnTheCard: card?.name_on_card ?? "")
        self.view?.setNameOnTheCardHidden(isHidden: card?.isNameOnTheCardHidden ?? false)
        self.view?.setNotesWith(notes: card?.note ?? "")
        self.view?.setNotesHidden(isHidden: card?.isNotesHidden ?? false)
    }
}

//MARK: EditCardController delegate
extension CardDetailsPresenter {
    func updateCardWith(card: Card?){
        self.card = card
        self.view?.setFrontCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_front ?? "" : card?.image_front ?? "")
        self.view?.setBackCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_back ?? "" : card?.image_back ?? "")
        self.view?.setCardNameWith(name: card?.name ?? "")
        self.view?.setCardNameHidden(isHidden: card?.isCardNameHidden ?? false)
        self.view?.setCardNumberWith(number: card?.cardNumber ?? "")
        self.view?.setCardNumberHidden(isHidden: card?.isCardNumberHidden ?? false)
        self.view?.setBarcodeWith(barcode: card?.code ?? "")
        self.view?.setBarcodeHidden(isHidden: card?.isBarcodeHidden ?? false)
        self.view?.setNameOnTheCardWith(nameOnTheCard: card?.name_on_card ?? "")
        self.view?.setNameOnTheCardHidden(isHidden: card?.isNameOnTheCardHidden ?? false)
        self.view?.setNotesWith(notes: card?.note ?? "")
        self.view?.setNotesHidden(isHidden: card?.isNotesHidden ?? false)
        self.delegate?.updateCards()
    }
}
