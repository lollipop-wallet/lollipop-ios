
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
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
