//
//  EditCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

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
        wireframe?.toDelete(alias: self.card?.alias ?? "")
    }
    
    func save(frontImage: UIImage, backImage: UIImage, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String){
        if self.card?.cardType == .loyalty {
            guard !cardName.isEmpty, !cardBarcode.isEmpty else {
                view?.validate(cardNameIsEmpty: cardName.isEmpty, cardCodeIsEmpty: cardBarcode.isEmpty)
                return
            }
            interactor?.updateCard(cardAlias: self.card?.alias ?? "", cardName: cardName, cardNumber: cardNumber, cardBarcode: cardBarcode, nameOnCard: nameOnCard, note: note)
        }else{
            
        }
    }
}

extension EditCardPresenter: EditCardOutputInteractorProtocol {
    func takeData(card: Card?, delegate: EditCardControllerProtocol?){
        self.card = card
        self.delegate = delegate
        self.view?.setFrontCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_front ?? "" : card?.image_front ?? "")
        self.view?.setBackCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_back ?? "" : card?.image_back ?? "")
        self.view?.setCardNameWith(name: card?.name ?? "")
        self.view?.setCardNumberWith(number: card?.cardNumber ?? "")
        self.view?.setBarcodeWith(barcode: card?.code ?? "")
        self.view?.setNameOnTheCardWith(nameOnTheCard: card?.name_on_card ?? "")
        self.view?.setNotesWith(notes: card?.note ?? "")
        self.view?.setFrontCameraControlHidden(isHidden: card?.cardType == .loyalty)
        self.view?.setBackCameraControlHidden(isHidden: card?.cardType == .loyalty)
    }
    
    func parseUpdatedCardData(result: Result<EditCardModel, AFError>){
        switch result {
        case .success(let model):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: model.message ?? "", shouldDismiss: false)
            self.card = model.data
            self.delegate?.updateCardWith(card: model.data)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
