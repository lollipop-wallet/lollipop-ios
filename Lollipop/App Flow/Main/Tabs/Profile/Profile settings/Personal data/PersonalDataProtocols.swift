//
//  PersonalDataProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PersonalDataPresenterProtocol: CalendarInputProtocol, DropdownInputFieldProtocol, DropdownProtocol {
    
    var interactor: PersonalDataInputInteractorProtocol? { get set }
    var view: PersonalDataViewProtocol? { get set }
    var wireframe:PersonalDataWireframeProtocol? { get set }
    
    func viewDidLoad()
    func handleGenderDropdownTapWith(item: Gender)
    func handleCityDropdownTapWith(item: String)
    func proceed(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PersonalDataInputInteractorProtocol: AnyObject {
    
    var presenter: PersonalDataOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func update(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PersonalDataOutputInteractorProtocol: AnyObject {
    func takeData(model: ProfileModel?, delegate: PersonalDataControllerProtocol?)
    func parseUpdateUserData(result: Result<PersonalDataModel, AFError>)
}
//MARK: View
protocol PersonalDataViewProtocol: AnyObject {
    
    var presenter: PersonalDataPresenterProtocol?  { get set }
    func displayCalendar()
    func setFirstName(firstName: String)
    func setLastName(lastName: String)
    func setEmail(email: String)
    func setDoB(dob: String)
    func setCity(city: String)
    func setGender(gender: String)
    func validate(isFirstNameEmpty: Bool, isLastNameEmpty: Bool, isEmailEmpty: Bool, isGenderEmpty: Bool, isDoBEmpty: Bool)
    func showDropdownWith(tag: Int)
    func hideDropdownWith(tag: Int)
}
//MARK: Wireframe
protocol PersonalDataWireframeProtocol: AnyObject {
    static var model: ProfileModel? { get set }
    static var delegate: PersonalDataControllerProtocol? { get set }
}

//MARK: PersonalDataController Protocol
protocol PersonalDataControllerProtocol: AnyObject {
    func didUpdateProfileWith(model: ProfileModel?)
}
