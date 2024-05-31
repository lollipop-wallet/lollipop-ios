//
//  CardDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol CardDetailsPresenterProtocol: EditCardControllerProtocol {
    
    var interactor: CardDetailsInputInteractorProtocol? { get set }
    var view: CardDetailsViewProtocol? { get set }
    var wireframe:CardDetailsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func edit()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol CardDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: CardDetailsOutputInteractorProtocol?  { get set }
    func viewDidLoad()

}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol CardDetailsOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?, delegate: CardDetailsControllerProtocol?)
}
//MARK: View
protocol CardDetailsViewProtocol: AnyObject {
    
    var presenter: CardDetailsPresenterProtocol?  { get set }
    func setFrontCardImageWith(image: String)
    func setBackCardImageWith(image: String)
    func setCardNameWith(name: String)
    func setCardNameHidden(isHidden: Bool)
    func setBarcodeWith(barcode: String)
    func setBarcodeHidden(isHidden: Bool)
    func setCardNumberWith(number: String)
    func setCardNumberHidden(isHidden: Bool)
    func setNameOnTheCardWith(nameOnTheCard: String)
    func setNameOnTheCardHidden(isHidden: Bool)
    func setNotesWith(notes: String)
    func setNotesHidden(isHidden: Bool)
}
//MARK: Wireframe
protocol CardDetailsWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    static var delegate: CardDetailsControllerProtocol? { get set }
    func toEdit(card: Card?, delegate: EditCardControllerProtocol?)
}

//MARK: CardDetailsController protocol
protocol CardDetailsControllerProtocol: AnyObject {
    func updateCards()
}
