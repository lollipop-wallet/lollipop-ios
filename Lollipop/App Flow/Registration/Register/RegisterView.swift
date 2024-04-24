
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

    var presenter: RegisterPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: RegisterView protocol
    func displayCalendar(){
        DispatchQueue.main.async {
            self.datePicker.isHidden = false
        }
    }
    
    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
}
