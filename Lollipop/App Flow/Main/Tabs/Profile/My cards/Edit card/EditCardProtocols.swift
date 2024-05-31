//
//  EditCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol EditCardPresenterProtocol: AnyObject {
    
    var interactor: EditCardInputInteractorProtocol? { get set }
    var view: EditCardViewProtocol? { get set }
    var wireframe:EditCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func delete()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol EditCardInputInteractorProtocol: AnyObject {
    
    var presenter: EditCardOutputInteractorProtocol?  { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol EditCardOutputInteractorProtocol: AnyObject {
    func takeData(card: Card?, delegate: EditCardControllerProtocol?)
}
//MARK: View
protocol EditCardViewProtocol: AnyObject {
    var presenter: EditCardPresenterProtocol?  { get set }
    func setFrontCardImageWith(image: String)
    func setBackCardImageWith(image: String)
    func setCardNameWith(name: String)
    func setBarcodeWith(barcode: String)
    func setCardNumberWith(number: String)
    func setNameOnTheCardWith(nameOnTheCard: String)
    func setNotesWith(notes: String)
    func setFrontCameraControlHidden(isHidden: Bool)
    func setBackCameraControlHidden(isHidden: Bool)
}
//MARK: Wireframe
protocol EditCardWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    static var delegate: EditCardControllerProtocol? { get set }
    func toDelete()
}

//MARK: EditCardController protocol
protocol EditCardControllerProtocol: AnyObject {
    func updateCardWith(card: Card?)
}
