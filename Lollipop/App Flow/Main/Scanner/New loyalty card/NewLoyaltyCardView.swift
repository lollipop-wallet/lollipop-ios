
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

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSaveTap() {
        
    }
    
    @objc func onFrontCameraTap() {
        presenter?.camera(isFront: true)
    }
    
    @objc func onBackCameraTap() {
        presenter?.camera(isFront: false)
    }
}
