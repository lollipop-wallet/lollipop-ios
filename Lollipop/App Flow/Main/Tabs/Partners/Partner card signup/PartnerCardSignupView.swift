
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
        print("dwadwad")
        DispatchQueue.main.async {

        }

        let datasource = ["dwa", "dwa","dwa","dwa","dwa","dwa"]
        self.phoneCodeDropDown.dataSource = datasource
        self.phoneCodeDropDown.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
            guard let cell = cell as? PhoneNumberPrefixTableViewCell else { return }
            cell.countryFlagImageView.backgroundColor = .red
            cell.countryNameLabel.text = "Crna Gora"
            cell.countryCodeLabel.text = "+382"
        }
        
        self.phoneCodeDropDown.selectionAction = { [weak self] (index, item) in
            guard let self = self else {return}
        }
        
        self.phoneCodeDropDown.show()
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
