
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
        }
    }
    
    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func handleDatePicker() {
        DispatchQueue.main.async {
            self.calendarField.text = self.datePicker.date.asString(style: .medium)
            self.calendarField.textColor = AppColors.black
            self.calendarField.borderColor = AppColors.black
        }
    }
    
    @objc func onProceedTap() {
        presenter?.proceed()
    }
    
    @objc func onAlreadyHaveAccountTap() {
        popBack(2)
    }
}
