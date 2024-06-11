
//
//  PartnerCardSignupView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit
//import DropDown

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
    var cityDropDown = DropDown()


    var presenter: PartnerCardSignupPresenterProtocol?

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
    
    //MARK: PartnerCardSignupView protocol
    func showDropdownWith(tag: Int){
        if tag == 0 {
            self.cityDropDown.show()
            self.cityField.borderWidth = 2
            self.cityField.borderColor = AppColors.link
        }else{
            self.phoneCodeDropDown.show()
            self.phonePrefixField.borderWidth = 2
            self.phonePrefixField.borderColor = AppColors.link
        }
    }
    
    func hideDropdownWith(tag: Int){
        if tag == 0 {
            self.cityField.isDropdownHidden = true
            self.cityField.borderWidth = 1
            self.cityField.borderColor = AppColors.mediumGrey
        }else{
            self.phonePrefixField.isDropdownHidden = true
            self.phonePrefixField.borderWidth = 1
            self.phonePrefixField.borderColor = AppColors.mediumGrey
        }
    }
    
    func setCardImageWith(image: String){
        DispatchQueue.main.async {
            self.cardImageView.imageFromURL(url: image)
        }
    }
    
    func setPrefixWith(prefix: String){
        DispatchQueue.main.async {
            self.phoneField.leftLabelSupplementaryText = prefix
        }
    }
    
    func setCityWith(item: String){
        DispatchQueue.main.async {
            self.cityField.text = item
        }
    }
    
    func setFlagWith(flag: String){
        self.phonePrefixField.text = flag
    }
    
    func setTermsCheckWith(isOn: Bool){
        DispatchQueue.main.async {
            self.checkBoxIcon.image = UIImage(named: isOn ? AssetTitles.checkBoxSelectedIcon : AssetTitles.checkBoxUnselectedIcon)
        }
    }
    
    func validate(isNameEmpty: Bool, isCityEmpty: Bool, isPhoneEmpty: Bool, isEmailEmpty: Bool){
        self.nameField.borderWidth = 1
        self.nameField.borderColor = isNameEmpty ? AppColors.error : AppColors.black
        
        self.cityField.borderWidth = 1
        self.cityField.borderColor = isCityEmpty ? AppColors.error : AppColors.black
        
        self.phoneField.borderWidth = 1
        self.phoneField.borderColor = isPhoneEmpty ? AppColors.error : AppColors.black
        
        self.emailField.borderWidth = 1
        self.emailField.borderColor = isEmailEmpty ? AppColors.error : AppColors.black
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onCheckboxTap() {
        presenter?.onTermsCheckTap()
    }
    
    @objc func onSendTap() {
        presenter?.send(name: self.nameField.textField.text ?? "", city: self.cityField.text ?? "", prefix: self.phoneField.inputFieldSuplementaryLeftLabel.text ?? "", phone: self.phoneField.textField.text ?? "", email: self.emailField.textField.text ?? "")
    }
    
    @objc func onTermsLabelTap(sender: UITapGestureRecognizer) {
        if sender.didTapAttributedTextInLabel(label: termsLabel, targetText: LocalizedTitle.termsString.localized) {
            presenter?.openTermsAndConditions()
        } else {
            print("Tapped none")
        }
    }
}
