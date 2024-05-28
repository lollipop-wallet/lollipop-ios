//
//  NewPartnerProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol NewPartnerPresenterProtocol:  DropdownInputFieldProtocol, DropdownProtocol, DialogueControllerProtocol {
    
    var interactor: NewPartnerInputInteractorProtocol? { get set }
    var view: NewPartnerViewProtocol? { get set }
    var wireframe:NewPartnerWireframeProtocol? { get set }
    
    func handleCityDropdownTapWith(item: String)
    func send(shopName: String, city: String, address: String, note: String)
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol NewPartnerInputInteractorProtocol: AnyObject {
    
    var presenter: NewPartnerOutputInteractorProtocol?  { get set }
    func send(shopName: String, country: String, city: String, address: String, note: String)

}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol NewPartnerOutputInteractorProtocol: AnyObject {
    func parseSuggestionResult(result: Result<NewPartnerModel, AFError>)
}
//MARK: View
protocol NewPartnerViewProtocol: AnyObject {
    
    var presenter: NewPartnerPresenterProtocol?  { get set }
    
    func showDropdownWith(tag: Int)
    func hideDropdownWith(tag: Int)
    func setCityWith(item: String)
    func validate(isShopNameEmpty: Bool)
}
//MARK: Wireframe
protocol NewPartnerWireframeProtocol: AnyObject {
    func toDialogue(delegate: DialogueControllerProtocol?)
}
