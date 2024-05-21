//
//  NewUserProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewUserPresenterProtocol: DropdownInputFieldProtocol, CalendarInputProtocol {
    
    var interactor: NewUserInputInteractorProtocol? { get set }
    var view: NewUserViewProtocol? { get set }
    var wireframe:NewUserWireframeProtocol? { get set }
    
    func proceed()

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewUserInputInteractorProtocol: AnyObject {
    
    var presenter: NewUserOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewUserOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol NewUserViewProtocol: AnyObject {
    
    var presenter: NewUserPresenterProtocol?  { get set }
    func displayCalendar()

}
//MARK: Wireframe
protocol NewUserWireframeProtocol: AnyObject {
    func toPWd()
}
