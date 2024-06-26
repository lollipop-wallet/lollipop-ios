//
//  DialogueProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol DialoguePresenterProtocol: AnyObject {
    
    var interactor: DialogueInputInteractorProtocol? { get set }
    var view: DialogueViewProtocol? { get set }
    var wireframe:DialogueWireframeProtocol? { get set }
    
    func viewDidLoad()
    func action()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol DialogueInputInteractorProtocol: AnyObject {
    
    var presenter: DialogueOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol DialogueOutputInteractorProtocol: AnyObject {
    func takeDataWith(icon: String, title:  String, subtitle: String, buttonTitle: String?, type: DialogueType?, popAmount: Int, delegate: DialogueControllerProtocol?)
}
//MARK: View
protocol DialogueViewProtocol: AnyObject {
    
    var presenter: DialoguePresenterProtocol?  { get set }
    
    func setIconWith(icon: String)
    func setTitleWith(title: String)
    func setSubtitleWith(subtitle: String)
    func setButtonTitleWith(buttonTitle: String)
}
//MARK: Wireframe
protocol DialogueWireframeProtocol: AnyObject {
    static var icon: String? { get set }
    static var title: String? { get set }
    static var subtitle: String? { get set }
    static var buttonTitle: String? { get set }
    static var type: DialogueType? { get set }
    static var delegate: DialogueControllerProtocol? { get set }
    static var popAmount: Int? { get set }
}

//MARK: DialogueController Protocol
protocol DialogueControllerProtocol: AnyObject {
    
}
