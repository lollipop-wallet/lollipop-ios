
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
    
    var cardImageView = UIImageView()
    var cardNameField = InputField()
    var cardNumberField = InputField()
    var cardBarcodeField = InputField()
    var cardNotesField = InputTextViewField()

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

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSaveTap() {
        
    }
}
