//
//  LanguageProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol LanguagePresenterProtocol: UITableViewDelegate, UITableViewDataSource, LanguageTableViewCellProtocol {
    
    var interactor: LanguageInputInteractorProtocol? { get set }
    var view: LanguageViewProtocol? { get set }
    var wireframe:LanguageWireframeProtocol? { get set }
    
    func viewDidLoad()
    func save()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LanguageInputInteractorProtocol: AnyObject {
    
    var presenter: LanguageOutputInteractorProtocol?  { get set }
    func updateLanWith(languageId: Int)
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LanguageOutputInteractorProtocol: AnyObject {
    func parseUpdatedLanguageData(result: Result<LanguageModel, AFError>)
}
//MARK: View
protocol LanguageViewProtocol: AnyObject {
    
    var presenter: LanguagePresenterProtocol?  { get set }
    func reload()
    func setTitleWith(title: String)
    func setSubtitleWith(subtitle: String)
    func setSaveButtonTitleWith(title: String)
}
//MARK: Wireframe
protocol LanguageWireframeProtocol: AnyObject {
    
}

//MARK: LanguageTableViewCell Protocol
protocol LanguageTableViewCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
