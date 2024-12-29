
//
//  PersonalDataView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PersonalDataView: UIViewController, PersonalDataViewProtocol {
    
    var presenter: PersonalDataPresenterProtocol?
    
    var nameField = InputField()
    var surnameField = InputField()
    var emailField = InputField()
    var phoneField = InputField()
    var calendarField = CalendarInputField()
    var datePicker = UIDatePicker()
    var datePickerStackView = UIStackView()
    var genderField = DropdownInputField()
    var cityField = DropdownInputField()
    var cityDropdown = DropDown()
    var genderDropdown = DropDown()

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
    
    //MARK: PersonalDataView protocol
    func displayCalendar(){
        DispatchQueue.main.async {
            self.datePickerStackView.isHidden = !self.datePickerStackView.isHidden
        }
    }
    
    func setFirstName(firstName: String){
        DispatchQueue.main.async {
            self.nameField.text = firstName
        }
    }
    func setLastName(lastName: String){
        DispatchQueue.main.async {
            self.surnameField.text = lastName
        }
    }
    func setEmail(email: String){
        DispatchQueue.main.async {
            self.emailField.text = email
        }
    }
    func setDoB(dob: String){
        DispatchQueue.main.async {
            self.calendarField.text = dob
            self.calendarField.textColor = AppColors.black
            self.calendarField.borderColor = AppColors.black
        }
    }
    func setCity(city: String){
        DispatchQueue.main.async {
            self.cityField.text = city
        }
    }
    
    func setGender(gender: String) {
        DispatchQueue.main.async {
            self.genderField.text = gender
        }
    }
    
    func setPhoneWith(phone: String){
        DispatchQueue.main.async {
            self.phoneField.text = phone
        }
    }
    
    func validate(isFirstNameEmpty: Bool, isLastNameEmpty: Bool, isEmailEmpty: Bool, isGenderEmpty: Bool, isDoBEmpty: Bool){
        self.nameField.borderWidth = 1
        self.nameField.borderColor = isFirstNameEmpty ? AppColors.error : AppColors.black
        self.surnameField.borderWidth = 1
        self.surnameField.borderColor = isLastNameEmpty ? AppColors.error : AppColors.black
        self.emailField.borderWidth = 1
        self.emailField.borderColor = isEmailEmpty ? AppColors.error : AppColors.black
        self.genderField.borderWidth = 1
        self.genderField.borderColor = isGenderEmpty ? AppColors.error : AppColors.black
        self.calendarField.borderWidth = 1
        self.calendarField.borderColor = isDoBEmpty ? AppColors.error : AppColors.black
    }
    
    func showDropdownWith(tag: Int){
        if tag == 0 {
            self.genderDropdown.show()
            self.genderField.borderWidth = 2
            self.genderField.borderColor = AppColors.link
        }else{
            self.cityDropdown.show()
            self.cityField.borderWidth = 2
            self.cityField.borderColor = AppColors.link
        }
    }
    
    func hideDropdownWith(tag: Int){
        if tag == 0 {
            self.genderField.isDropdownHidden = true
            self.genderField.borderWidth = 1
            self.genderField.borderColor = AppColors.mediumGrey
        }else{
            self.cityField.isDropdownHidden = true
            self.cityField.borderWidth = 1
            self.cityField.borderColor = AppColors.mediumGrey
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func handleDatePicker() {
        DispatchQueue.main.async {
            self.calendarField.text = self.datePicker.date.asString(dateFormat: "dd.MM.yyyy")
            self.calendarField.textColor = AppColors.black
            self.calendarField.borderColor = AppColors.black
        }
    }
    
    @objc func onProceedTap() {
        presenter?.proceed(firstname: nameField.textField.text ?? "", lastname: surnameField.textField.text ?? "", email: emailField.textField.text ?? "", phone: self.phoneField.textField.text ?? "", dob: calendarField.inputLabel.text ?? "", gender: genderField.inputLabel.text ?? "", city: cityField.inputLabel.text ?? "")
    }
}
