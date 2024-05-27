
//
//  NewPartnerView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class NewPartnerView: UIViewController, NewPartnerViewProtocol {
    
    var shopNameField = InputField()
    var cityField = DropdownInputField()
    var addressField = InputField()
    var noteField = InputTextViewField()
    var cityDropdown = DropDown()

    var presenter: NewPartnerPresenterProtocol?

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
    
    //MARK: NewPartnerView protocol
    
    func showDropdownWith(tag: Int){
        self.cityDropdown.show()
        self.cityField.borderWidth = 2
        self.cityField.borderColor = AppColors.link
    }
    
    func hideDropdownWith(tag: Int){
        self.cityField.isDropdownHidden = true
        self.cityField.borderWidth = 1
        self.cityField.borderColor = AppColors.mediumGrey
    }
    
    func setCityWith(item: String){
        DispatchQueue.main.async {
            self.cityField.text = item
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSendTap() {
        
    }
}
