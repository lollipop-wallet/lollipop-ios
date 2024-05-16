//
//  PartnerCardSignupProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerCardSignupPresenterProtocol: DropdownInputFieldProtocol {
    
    var interactor: PartnerCardSignupInputInteractorProtocol? { get set }
    var view: PartnerCardSignupViewProtocol? { get set }
    var wireframe:PartnerCardSignupWireframeProtocol? { get set }
    
    func handleDropDownTap()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerCardSignupInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerCardSignupOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerCardSignupOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PartnerCardSignupViewProtocol: AnyObject {
    
    var presenter: PartnerCardSignupPresenterProtocol?  { get set }
    func setupAndOpenPhonePrefixDropdown()
    func hidePrefixDropdown()
}
//MARK: Wireframe
protocol PartnerCardSignupWireframeProtocol: AnyObject {

    
}
