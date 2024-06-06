//
//  PartnerCardSignupProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerCardSignupPresenterProtocol: DropdownInputFieldProtocol, DropdownProtocol, DropdownInputFieldProtocol, DialogueControllerProtocol {
    
    var interactor: PartnerCardSignupInputInteractorProtocol? { get set }
    var view: PartnerCardSignupViewProtocol? { get set }
    var wireframe:PartnerCardSignupWireframeProtocol? { get set }

    func viewDidLoad()
    func handleDropDownTap(item: CountryCode)
    func handleCityDropdownTapWith(item: String)
    func onTermsCheckTap()
    func send(name: String, city: String, prefix: String, phone: String, email: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerCardSignupInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerCardSignupOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func inquiry(name: String, city: String, phone: String, partnerAlias: String, email: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerCardSignupOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?)
    func parseInquiryData(result: Result<PartnerCardSignupModel, AFError>)
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
    func setTermsCheckWith(isOn: Bool)
    func validate(isNameEmpty: Bool, isCityEmpty: Bool, isPhoneEmpty: Bool, isEmailEmpty: Bool)

}
//MARK: Wireframe
protocol PartnerCardSignupWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    func toDialogue(delegate: DialogueControllerProtocol?)
}
