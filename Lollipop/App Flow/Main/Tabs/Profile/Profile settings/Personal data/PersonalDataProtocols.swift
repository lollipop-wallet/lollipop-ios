//
//  PersonalDataProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol PersonalDataPresenterProtocol: CalendarInputProtocol, DropdownInputFieldProtocol {
    
    var interactor: PersonalDataInputInteractorProtocol? { get set }
    var view: PersonalDataViewProtocol? { get set }
    var wireframe:PersonalDataWireframeProtocol? { get set }
    
    func viewDidLoad()
    func proceed()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PersonalDataInputInteractorProtocol: AnyObject {
    
    var presenter: PersonalDataOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PersonalDataOutputInteractorProtocol: AnyObject {
    func takeData(model: ProfileModel?)
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
}
//MARK: Wireframe
protocol PersonalDataWireframeProtocol: AnyObject {
    static var model: ProfileModel? { get set }
}

