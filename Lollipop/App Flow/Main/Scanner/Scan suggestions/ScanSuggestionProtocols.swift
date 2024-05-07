//
//  ScanSuggestionProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol ScanSuggestionPresenterProtocol: UITableViewDelegate, UITableViewDataSource, ScanSuggestionCellProtocol{
    
    var interactor: ScanSuggestionInputInteractorProtocol? { get set }
    var view: ScanSuggestionViewProtocol? { get set }
    var wireframe:ScanSuggestionWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ScanSuggestionInputInteractorProtocol: AnyObject {
    
    var presenter: ScanSuggestionOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ScanSuggestionOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ScanSuggestionViewProtocol: AnyObject {
    
    var presenter: ScanSuggestionPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ScanSuggestionWireframeProtocol: AnyObject {

    
}

//MARK: ScanSuggestionCell Protocol
protocol ScanSuggestionCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
