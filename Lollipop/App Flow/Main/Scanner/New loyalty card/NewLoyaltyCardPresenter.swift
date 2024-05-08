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


class NewLoyaltyCardPresenter: NSObject, NewLoyaltyCardPresenterProtocol  {
    
    var interactor : NewLoyaltyCardInputInteractorProtocol?
    weak var view: NewLoyaltyCardViewProtocol?
    var wireframe: NewLoyaltyCardWireframeProtocol?
    
    var isFrontCard = Bool()
    var config = PHPickerConfiguration(photoLibrary: .shared())

    func camera(isFront: Bool){
        config.selectionLimit = 1
        config.filter = PHPickerFilter.images
        self.isFrontCard = isFront
        UIApplication.topViewController()?.openAlert(title: isFront ? LocalizedTitle.frontCardPage.localized : LocalizedTitle.backCardPage.localized, message: LocalizedTitle.photoOrAlbumDescription.localized, alertStyle: .actionSheet, actionTitles: [LocalizedTitle.takeAPhoto.localized, LocalizedTitle.photoAlbum.localized, LocalizedTitle.cancel.localized], actionColors: [.systemBlue, .systemBlue, .systemBlue], actionStyles: [.default, .default, .cancel], actions: [
            { [weak self] _ in
                guard let self = self  else {return}
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    var imagePicker = UIImagePickerController()
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
}

extension NewLoyaltyCardPresenter: NewLoyaltyCardOutputInteractorProtocol {
    
}

//MARK: PHPickerController Delegate & ImagePicker delegate
extension NewLoyaltyCardPresenter {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: nil)
        
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
                self.view?.setFrontCardImageWith(image: images.first ?? UIImage(), isFront: self.isFrontCard)
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        self.view?.setFrontCardImageWith(image: image, isFront: self.isFrontCard)
    }
}
