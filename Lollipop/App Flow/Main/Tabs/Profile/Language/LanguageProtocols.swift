//
//  LanguageProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol LanguagePresenterProtocol: AnyObject {
    
    var interactor: LanguageInputInteractorProtocol? { get set }
    var view: LanguageViewProtocol? { get set }
    var wireframe:LanguageWireframeProtocol? { get set }
    
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
    
}
//MARK: Wireframe
protocol LanguageWireframeProtocol: AnyObject {

    
}
