//
//  DeleteCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol DeleteCardPresenterProtocol: AnyObject {
    
    var interactor: DeleteCardInputInteractorProtocol? { get set }
    var view: DeleteCardViewProtocol? { get set }
    var wireframe:DeleteCardWireframeProtocol? { get set }
    
    func viewDidLoad()
    func delete()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DeleteCardInputInteractorProtocol: AnyObject {
    
    var presenter: DeleteCardOutputInteractorProtocol?  { get set }
    func viewDidLoad()
    func delete(alias: String)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DeleteCardOutputInteractorProtocol: AnyObject {
    func takeData(delegate: DeleteCardControllerProtocol?, alias: String?, destination: CardDeletionArrivalDestination?)
    func parseDeletedCardData(result: Result<DeleteCardModel, AFError>)
}
//MARK: View
protocol DeleteCardViewProtocol: AnyObject {
    
    var presenter: DeleteCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol DeleteCardWireframeProtocol: AnyObject {
    static var delegate: DeleteCardControllerProtocol? { get set }
    static var alias: String? { get set }
    static var destination: CardDeletionArrivalDestination? { get set }
}

//MARK: DeleteCardControllerProtocol
protocol DeleteCardControllerProtocol: AnyObject {
    func didDeleteCard()
}
