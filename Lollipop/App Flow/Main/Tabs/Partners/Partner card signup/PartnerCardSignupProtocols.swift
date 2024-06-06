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
protocol PartnerCardSignupPresenterProtocol: DropdownInputFieldProtocol, DropdownProtocol, DropdownInputFieldProtocol {
    
    var interactor: PartnerCardSignupInputInteractorProtocol? { get set }
    var view: PartnerCardSignupViewProtocol? { get set }
    var wireframe:PartnerCardSignupWireframeProtocol? { get set }

    func viewDidLoad()
    func handleDropDownTap(item: CountryCode)
    func handleCityDropdownTapWith(item: String)

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerCardSignupInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerCardSignupOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerCardSignupOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?)
}
//MARK: View
protocol PartnerCardSignupViewProtocol: AnyObject {
    
    var presenter: PartnerCardSignupPresenterProtocol?  { get set }
    func showDropdownWith(tag: Int)
    func hideDropdownWith(tag: Int)
    func setCardImageWith(image: String)
    func setPrefixWith(prefix: String)
    func setFlagWith(flag: String)
    func setCityWith(item: String)

}
//MARK: Wireframe
protocol PartnerCardSignupWireframeProtocol: AnyObject {
    static var card: Card? { get set }
}
