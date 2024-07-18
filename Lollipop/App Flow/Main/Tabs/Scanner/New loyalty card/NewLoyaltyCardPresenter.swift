//
//  NewLoyaltyCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Photos
import PhotosUI
import Alamofire
import CropViewController

class NewLoyaltyCardPresenter: NSObject, NewLoyaltyCardPresenterProtocol  {
    
    var interactor : NewLoyaltyCardInputInteractorProtocol?
    weak var view: NewLoyaltyCardViewProtocol?
    var wireframe: NewLoyaltyCardWireframeProtocol?
    var delegate: NewLoyaltyCardControllerProtocol?
    
    var card: Card?
    var barcode: String?
    var isFromTemplate: Bool?
    var isFrontCard = Bool()
    var config = PHPickerConfiguration(photoLibrary: .shared())
    var frontImage: UIImage?
    var backImage: UIImage?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
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
    
    func save(frontImage: UIImage, backImage: UIImage, cardName: String, cardNumber: String, cardBarcode: String, nameOnCard: String, note: String) {
        if (self.isFromTemplate ?? false){
            guard !cardName.isEmpty, !cardBarcode.isEmpty else {
                view?.validateLoyalty(cardNameIsEmpty: cardName.isEmpty, barcodeIsEmpty: cardBarcode.isEmpty)
                return
            }
            let codeType = self.card?.cardCodeType == .plaincode ? (self.card?.code_type ?? "") : (!cardBarcode.isEmpty ? (self.card?.code_type ?? "") : "")
            interactor?.createCard(cardName: cardName, cardNumber: cardNumber, cardBarcode: cardBarcode, codeType: codeType, nameOnCard: nameOnCard, note: note, partnerAlias: card?.partner?.alias ?? "", cardTemplateId: card?.id ?? 0, cardType: self.card?.type ?? "")
        }else{
            
            if self.card?.cardType == .loyalty {
                guard !cardName.isEmpty, !cardBarcode.isEmpty else {
                    view?.validateLoyalty(cardNameIsEmpty: cardName.isEmpty, barcodeIsEmpty: cardBarcode.isEmpty)
                    return
                }
            }else{
                guard !cardName.isEmpty else {
                    view?.validate(cardNameIsEmpty: cardName.isEmpty)
                    return
                }
            }
            
            guard self.frontImage != nil, self.backImage != nil else {
                Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: LocalizedTitle.cardImagesNotSet.localized, shouldDismiss: false)
                return
            }
            
            let frontImageData = self.frontImage?.jpegData(compressionQuality: 0.4) ?? Data()
            let backImageData = self.backImage?.jpegData(compressionQuality: 0.4) ?? Data()
            
            interactor?.createDisplayCarad(frontImage: frontImageData, backImage: backImageData, cardName: cardName, cardNumber: cardNumber, cardBarCode: cardBarcode, codeType: self.card?.code_type ?? "", nameOnTheCard: nameOnCard, note: note)
        }
    }
}

extension NewLoyaltyCardPresenter: NewLoyaltyCardOutputInteractorProtocol {
    func takeDataWith(card: Card?, barcode: String, isFromTemplate: Bool, delegate: NewLoyaltyCardControllerProtocol? ) {
        print("Koji je code type: ", card?.code_type ?? "")
        self.card = card
        self.barcode = barcode
        self.isFromTemplate = isFromTemplate
        self.delegate = delegate
        self.view?.setCardNameWith(name: card?.name ?? "")
        if isFromTemplate {
            self.view?.setFrontCardImageWith(image: card?.image_front ?? "")
            self.view?.setBackCardImageWith(image: card?.image_back ?? "")
        }
        if !barcode.isEmpty {
            self.view?.setBarcodeWith(barcode: barcode)
        }
        self.view?.setFrontCameraControlHidden(isHidden: isFromTemplate)
        self.view?.setBackCameraControlHidden(isHidden: isFromTemplate)
        //self.view?.setBarcodeFieldHidden(isHidden: card?.cardCodeType == .plaincode)
    }
    
    func parseNewCardData(result: Result<NewLoyaltyCardModel, AFError>){
        switch result {
        case .success(let model):
            UIApplication.topViewController()?.openAlert(title: LocalizedTitle.notice.localized, message: model.message ?? "", alertStyle: .alert, actionTitles: [LocalizedTitle.ok.localized], actionColors: [.systemBlue], actionStyles: [.default], actions: [
                { [weak self] _ in
                    guard let self = self  else {return}
                    self.wireframe?.toMain()
                }
           ])
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}

//MARK: PHPickerController Delegate & ImagePicker delegate
extension NewLoyaltyCardPresenter {
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
extension NewLoyaltyCardPresenter {
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
