//
//  PersonalDataProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PersonalDataPresenterProtocol: AnyObject {
    
    var interactor: PersonalDataInputInteractorProtocol? { get set }
    var view: PersonalDataViewProtocol? { get set }
    var wireframe:PersonalDataWireframeProtocol? { get set }
    
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
    
}
//MARK: Wireframe
protocol PersonalDataWireframeProtocol: AnyObject {

    
}

//MARK: PersonalDataCell Protocol
protocol PersonalDataCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
