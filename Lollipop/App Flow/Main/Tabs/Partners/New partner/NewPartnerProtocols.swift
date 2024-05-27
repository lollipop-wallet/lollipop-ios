//
//  NewPartnerProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewPartnerPresenterProtocol:  DropdownInputFieldProtocol, DropdownProtocol {
    
    var interactor: NewPartnerInputInteractorProtocol? { get set }
    var view: NewPartnerViewProtocol? { get set }
    var wireframe:NewPartnerWireframeProtocol? { get set }
    
    func handleCityDropdownTapWith(item: String)

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewPartnerInputInteractorProtocol: AnyObject {
    
    var presenter: NewPartnerOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewPartnerOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol NewPartnerViewProtocol: AnyObject {
    
    var presenter: NewPartnerPresenterProtocol?  { get set }
    
    func showDropdownWith(tag: Int)
    func hideDropdownWith(tag: Int)
    func setCityWith(item: String)
}
//MARK: Wireframe
protocol NewPartnerWireframeProtocol: AnyObject {

    
}
