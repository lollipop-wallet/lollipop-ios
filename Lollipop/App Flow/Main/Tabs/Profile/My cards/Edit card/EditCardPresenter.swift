//
//  EditCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire
import Photos
import PhotosUI
import CropViewController

class EditCardPresenter: NSObject, EditCardPresenterProtocol  {
    
    var interactor : EditCardInputInteractorProtocol?
    weak var view: EditCardViewProtocol?
    var wireframe: EditCardWireframeProtocol?
    
    var delegate: EditCardControllerProtocol?
    var card: Card?
    var isFrontCard = Bool()
    var config = PHPickerConfiguration(photoLibrary: .shared())
    var frontImage: UIImage?
    var backImage: UIImage?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func delete(){
        wireframe?.toDelete(alias: self.card?.alias ?? "")
    }
    
    func camera(isFront: Bool){
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images

        self.isFrontCard = isFront
        UIApplication.topViewController()?.openAlert(title: isFront ? LocalizedTitle.frontCardPage.localized : LocalizedTitle.backCardPage.localized, message: LocalizedTitle.photoOrAlbumDescription.localized, alertStyle: .actionSheet, actionTitles: [LocalizedTitle.takeAPhoto.localized, LocalizedTitle.photoAlbum.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = .camera;
                    imagePicker.allowsEditing = false
                    UIApplication.topViewController()?.present(imagePicker, animated: true, completion: nil)
                }
            },
            { [weak self] _ in
                guard let self = self  else {return}
                let pickerViewController = PHPickerViewController(configuration: self.config)
                pickerViewController.delegate = self
                pickerViewController.modalPresentationStyle = .fullScreen
                UIApplication.topViewController()?.present(pickerViewController, animated: true, completion: nil)
            },
            {_ in
            }
       ])
    }
    
    func save(frontImage: UIImage, backImage: UIImage, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String){
        if self.card?.cardType == .loyalty {
            guard !cardName.isEmpty, !cardBarcode.isEmpty else {
                view?.validate(cardNameIsEmpty: cardName.isEmpty, cardCodeIsEmpty: cardBarcode.isEmpty)
                return
            }
            interactor?.updateCard(cardAlias: self.card?.alias ?? "", cardName: cardName, cardNumber: cardNumber, cardBarcode: cardBarcode, nameOnCard: nameOnCard, note: note)
        }else{
            guard !cardName.isEmpty else {
                view?.validate(cardNameIsEmpty: cardName.isEmpty)
                return
            }
            
//            guard frontImage != nil, backImage != nil else {
//                Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.cardImagesNotSet.localized, shouldDismiss: false)
//                return
//            }
            
            let frontImageData = frontImage.jpegData(compressionQuality: 0.4) ?? Data()
            let backImageData = backImage.jpegData(compressionQuality: 0.4) ?? Data()
            
            interactor?.updatedisplaycard(cardAlias: self.card?.alias ?? "", frontImage: frontImageData, backImage: backImageData, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarcode, codeType: self.card?.code_type ?? "", nameOnTheCard: nameOnCard, note: note)
        }
    }
}

extension EditCardPresenter: EditCardOutputInteractorProtocol {
    func takeData(card: Card?, delegate: EditCardControllerProtocol?){
        self.card = card
        self.delegate = delegate
        self.view?.setFrontCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_front ?? "" : (card?.card_template != nil ? (card?.card_template?.image_front ?? "") : card?.image_front ?? ""))
        self.view?.setBackCardImageWith(image: card?.cardType == .loyalty ? card?.card_template?.image_back ?? "" : (card?.card_template != nil ? (card?.card_template?.image_back ?? "") : card?.image_back ?? ""))
        self.view?.setCardNameWith(name: card?.name ?? "")
        self.view?.setCardNumberWith(number: card?.customer_code ?? "")
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

//MARK: PHPickerController Delegate & ImagePicker delegate
extension EditCardPresenter {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) {
            let imageItems = results.map { $0.itemProvider }.filter { $0.canLoadObject(ofClass: UIImage.self) }
            
            let dispatchGroup = DispatchGroup()
            var images = [UIImage]()
            
            for imageItem in imageItems {
                dispatchGroup.enter() // signal IN
                imageItem.loadObject(ofClass: UIImage.self) { image, _ in
                    if let image = image as? UIImage {
                        images.append(image)
                    }
                    dispatchGroup.leave() // signal OUT
                }
            }
            // This is called at the end; after all signals are matched (IN/OUT)
            dispatchGroup.notify(queue: .main) {
                if !images.isEmpty{
                    self.wireframe?.toCropViewControllerWith(image: images.first ?? UIImage(), delegate: self)
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            guard let image = info[.originalImage] as? UIImage else {
                return
            }
            self.wireframe?.toCropViewControllerWith(image: image, delegate: self)
        }
    }
}

//MAKR: Cropview controller delegate
extension EditCardPresenter {
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        UIApplication.topViewController()?.dismiss(animated: true)
            self.view?.setFrontCardImageWith(image: image, isFront: self.isFrontCard)
            if self.isFrontCard {
                self.frontImage = image
            }else{
                self.backImage = image
            }
    }
}
