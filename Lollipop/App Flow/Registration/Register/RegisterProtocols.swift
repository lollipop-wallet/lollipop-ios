//
//  RegisterProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol RegisterPresenterProtocol: CalendarInputProtocol, DropdownInputFieldProtocol, DropdownProtocol {
    
    var interactor: RegisterInputInteractorProtocol? { get set }
    var view: RegisterViewProtocol? { get set }
    var wireframe:RegisterWireframeProtocol? { get set }
    
    func proceed(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String)
    func handleGenderDropdownTapWith(item: Gender)
    func handleCityDropdownTapWith(item: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol RegisterInputInteractorProtocol: AnyObject {
    
    var presenter: RegisterOutputInteractorProtocol?  { get set }
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol RegisterOutputInteractorProtocol: AnyObject {
}
//MARK: View
protocol RegisterViewProtocol: AnyObject {
    
    var presenter: RegisterPresenterProtocol?  { get set }
    func displayCalendar()
    func showDropdownWith(tag: Int)
    func hideDropdownWith(tag: Int)
    func setGenderWith(item: String)
    func setCityWith(item: String)
    func validate(isFirstNameEmpty: Bool, isLastNameEmpty: Bool, isEmailEmpty: Bool, isGenderEmpty: Bool, isDoBEmpty: Bool)

}
//MARK: Wireframe
protocol RegisterWireframeProtocol: AnyObject {
    func toPWdWith(firstname: String, lastname: String, email: String, dob: String, gender: String, city: String)
}
