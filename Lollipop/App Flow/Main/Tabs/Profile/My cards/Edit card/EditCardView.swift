
//
//  EditCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class EditCardView: UIViewController, EditCardViewProtocol {
    
    var cardImageView = UIImageView()
    var cardNameField = InputField()
    var cardNumberField = InputField()
    var cardBarcodeField = InputField()
    var nameOnTheCardField = InputField()
    var cardNotesField = InputTextViewField()
    var cardImageFrontSideView = UIImageView()
    var cardImageBackSideView = UIImageView()
    var frontCardCameraViewPlaceholder = UIView()
    var backCardCameraViewPlaceholder = UIView()
    
    var presenter: EditCardPresenterProtocol?

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
    
    //MARK: EditCardView Protocol
    
    func setFrontCardImageWith(image: String){
        self.cardImageFrontSideView.imageFromURL(url: image)
    }
    
    func setBackCardImageWith(image: String){
        self.cardImageBackSideView.imageFromURL(url: image)
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
    
    func setCardNumberWith(number: String){
        DispatchQueue.main.async {
            self.cardNumberField.text = number
        }
    }
    
    
    func setNameOnTheCardWith(nameOnTheCard: String){
        DispatchQueue.main.async {
            self.nameOnTheCardField.text = nameOnTheCard
        }
    }
    
    
    func setNotesWith(notes: String){
        DispatchQueue.main.async {
            self.cardNotesField.text = notes
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onDeleteTap() {
        presenter?.delete()
    }
    
    @objc func onSaveTap() {
        
    }
    
    @objc func onFrontCameraTap() {
        //presenter?.camera(isFront: true)
    }
    
    @objc func onBackCameraTap() {
        //presenter?.camera(isFront: false)
    }
}
