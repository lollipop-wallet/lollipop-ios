//
//  ScanSuggestionProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol ScanSuggestionPresenterProtocol: UITableViewDelegate, UITableViewDataSource, ScanSuggestionCellProtocol{
    
    var interactor: ScanSuggestionInputInteractorProtocol? { get set }
    var view: ScanSuggestionViewProtocol? { get set }
    var wireframe:ScanSuggestionWireframeProtocol? { get set }
    
    func viewDidLoad()
    func newCard()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ScanSuggestionInputInteractorProtocol: AnyObject {
    
    var presenter: ScanSuggestionOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ScanSuggestionOutputInteractorProtocol: AnyObject {
    func parseCardsData(result: Result<[Card], AFError>)
}
//MARK: View
protocol ScanSuggestionViewProtocol: AnyObject {
    
    var presenter: ScanSuggestionPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol ScanSuggestionWireframeProtocol: AnyObject {
    func toScannerWith(card: Card?)
    func toNewCard()
}

//MARK: ScanSuggestionCell Protocol
protocol ScanSuggestionCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
