//
//  NewUserPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class NewUserPresenter: NSObject, NewUserPresenterProtocol  {
    
    var interactor : NewUserInputInteractorProtocol?
    weak var view: NewUserViewProtocol?
    var wireframe: NewUserWireframeProtocol?
    
    func proceed() {
        wireframe?.toPWd()
    }
}

extension NewUserPresenter: NewUserOutputInteractorProtocol {
    
}


//MARK: InputCalendarField delegate
extension NewUserPresenter {
    func showCalendar() {
        view?.displayCalendar()
    }
}

//MARK: Dropdown field delegate
extension NewUserPresenter {
    func showHideDropdown(isHidden: Bool) {
        
    }
}
