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
    
    func proceed()

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PersonalDataInputInteractorProtocol: AnyObject {
    
    var presenter: PersonalDataOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PersonalDataOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PersonalDataViewProtocol: AnyObject {
    
    var presenter: PersonalDataPresenterProtocol?  { get set }
    func displayCalendar()

}
//MARK: Wireframe
protocol PersonalDataWireframeProtocol: AnyObject {

    
}

