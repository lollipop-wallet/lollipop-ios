
//
//  NewLoyaltyCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class NewLoyaltyCardView: UIViewController, NewLoyaltyCardViewProtocol {
    
    var cardImageFrontSideView = UIImageView()
    var cardImageBackSideView = UIImageView()
    var cardImageView = UIImageView()
    var cardNameField = InputField()
    var cardNumberField = InputField()
    var nameOnTheCardField = InputField()
    var cardBarcodeField = InputField()
    var cardNotesField = InputTextViewField()
    var frontCardCameraViewPlaceholder = UIView()
    var backCardCameraViewPlaceholder = UIView()

    var presenter: NewLoyaltyCardPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: NewLoyaltyCardView protocol
    
    func setFrontCardImageWith(image: UIImage, isFront: Bool){
        DispatchQueue.main.async {
            if isFront {
                self.cardImageFrontSideView.image = image
            }else{
                self.cardImageBackSideView.image = image
            }
        }
    }
    
    func setFrontCardImageWith(image: String){
        DispatchQueue.main.async {
            self.cardImageFrontSideView.imageFromURL(url: image)
        }
    }
    
    func setBackCardImageWith(image: String){
        DispatchQueue.main.async {
            self.cardImageBackSideView.imageFromURL(url: image)
        }
    }
    
    func setCardNameWith(name: String){
        DispatchQueue.main.async {
            self.cardNameField.text = name
        }
    }
    
    func setBarcodeWith(barcode: String){
        DispatchQueue.main.async {
            self.cardBarcodeField.text = barcode
        }
    }
    
    func setFrontCameraControlHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.frontCardCameraViewPlaceholder.isHidden = isHidden
        }
    }
    
    func setBackCameraControlHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.backCardCameraViewPlaceholder.isHidden = isHidden
        }
    }
    
    func validate(cardNameIsEmpty: Bool){
        self.cardNameField.borderWidth = 1
        self.cardNameField.borderColor = cardNameIsEmpty ? AppColors.error : AppColors.black
    }
    
    func validateLoyalty(cardNameIsEmpty: Bool, barcodeIsEmpty: Bool){
        self.cardNameField.borderWidth = 1
        self.cardNameField.borderColor = cardNameIsEmpty ? AppColors.error : AppColors.black
        
        self.cardBarcodeField.borderWidth = 1
        self.cardBarcodeField.borderColor = barcodeIsEmpty ? AppColors.error : AppColors.black
    }
    
    func setBarcodeFieldHidden(isHidden: Bool) {
        DispatchQueue.main.async {
            self.cardBarcodeField.isHidden = isHidden
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSaveTap() {
        presenter?.save(frontImage: self.cardImageFrontSideView.image ?? UIImage(), backImage: self.cardImageBackSideView.image ?? UIImage(), cardName: self.cardNameField.textField.text ?? "", cardNumber: self.cardNumberField.textField.text ?? "", cardBarcode: self.cardBarcodeField.textField.text ?? "", nameOnCard: self.nameOnTheCardField.textField.text ?? "", note: self.cardNotesField.textView.text ?? "")
    }
    
    @objc func onFrontCameraTap() {
        presenter?.camera(isFront: true)
    }
    
    @objc func onBackCameraTap() {
        presenter?.camera(isFront: false)
    }
}
