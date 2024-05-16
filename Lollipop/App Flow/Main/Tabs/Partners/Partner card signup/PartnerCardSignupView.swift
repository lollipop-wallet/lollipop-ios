
//
//  PartnerCardSignupView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit
import DropDown

class PartnerCardSignupView: UIViewController, PartnerCardSignupViewProtocol {
    
    var cardImageView = UIImageView()
    var nameField = InputField()
    var cityField = DropdownInputField()
    var phonePrefixField = DropdownInputField()
    var phoneField = InputField()
    var emailField = InputField()
    var checkBoxIcon = UIImageView()
    var termsLabel = UILabel()
    var phoneStack = UIStackView()
    var phoneCodeDropDown = DropDown()


    var presenter: PartnerCardSignupPresenterProtocol?

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
    
    //MARK: PartnerCardSignupView protocol
    func setupAndOpenPhonePrefixDropdown(){        
        self.phoneCodeDropDown.show()
        self.phonePrefixField.isDropdownHidden = false
    }
    
    func hidePrefixDropdown(){
        self.phonePrefixField.isDropdownHidden = true
        self.phonePrefixField.borderWidth = 1.0
        self.phonePrefixField.borderColor = AppColors.mediumGrey
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onCheckboxTap() {
        
    }
    
    @objc func onSendTap() {
        
    }
    
    @objc func onTermsLabelTap(sender: UITapGestureRecognizer) {
        if sender.didTapAttributedTextInLabel(label: termsLabel, targetText: LocalizedTitle.termsString.localized) {
        } else {
            print("Tapped none")
        }
    }
}
