//
//  RegisterProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 24.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol RegisterPresenterProtocol: CalendarInputProtocol, DropdownInputFieldProtocol {
    
    var interactor: RegisterInputInteractorProtocol? { get set }
    var view: RegisterViewProtocol? { get set }
    var wireframe:RegisterWireframeProtocol? { get set }
    
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
}
//MARK: Wireframe
protocol RegisterWireframeProtocol: AnyObject {

    
}
