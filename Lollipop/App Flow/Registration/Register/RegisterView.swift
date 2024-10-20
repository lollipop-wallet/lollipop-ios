
//
//  RegisterView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class RegisterView: UIViewController, RegisterViewProtocol {
    
    var nameField = InputField()
    var surnameField = InputField()
    var emailField = InputField()
    var calendarField = CalendarInputField()
    var datePicker = UIDatePicker()
    var datePickerStackView = UIStackView()
    var genderField = DropdownInputField()
    var cityField = DropdownInputField()
    var cityDropdown = DropDown()
    var genderDropdown = DropDown()
    var hideCalendarButton = UIButton()

    var presenter: RegisterPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: RegisterView protocol
    func displayCalendar(){
        DispatchQueue.main.async {
            self.datePickerStackView.isHidden = !self.datePickerStackView.isHidden
            self.hideCalendarButton.isHidden = !self.hideCalendarButton.isHidden
        }
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
    
    func setGenderWith(item: String){
        DispatchQueue.main.async {
            self.genderField.text = item
        }
    }
    
    func setCityWith(item: String){
        DispatchQueue.main.async {
            self.cityField.text = item
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
        presenter?.proceed(firstname: nameField.textField.text ?? "", lastname: surnameField.textField.text ?? "", email: emailField.textField.text ?? "", dob: calendarField.inputLabel.text ?? "", gender: genderField.inputLabel.text ?? "", city: cityField.inputLabel.text ?? "")
    }
    
    @objc func onAlreadyHaveAccountTap() {
        popBack(2)
    }
    
    @objc func hideCalendar() {
        self.datePickerStackView.isHidden = true
        self.hideCalendarButton.isHidden = true
    }
}
