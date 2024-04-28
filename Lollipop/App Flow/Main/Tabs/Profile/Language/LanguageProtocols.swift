//
//  LanguageProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol LanguagePresenterProtocol: UITableViewDelegate, UITableViewDataSource, LanguageTableViewCellProtocol {
    
    var interactor: LanguageInputInteractorProtocol? { get set }
    var view: LanguageViewProtocol? { get set }
    var wireframe:LanguageWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LanguageInputInteractorProtocol: AnyObject {
    
    var presenter: LanguageOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LanguageOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol LanguageViewProtocol: AnyObject {
    
    var presenter: LanguagePresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol LanguageWireframeProtocol: AnyObject {
    
}

//MARK: LanguageTableViewCell Protocol
protocol LanguageTableViewCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
