//
//  ProgrammeRulesProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ProgrammeRulesPresenterProtocol: AnyObject {
    
    var interactor: ProgrammeRulesInputInteractorProtocol? { get set }
    var view: ProgrammeRulesViewProtocol? { get set }
    var wireframe:ProgrammeRulesWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ProgrammeRulesInputInteractorProtocol: AnyObject {
    
    var presenter: ProgrammeRulesOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ProgrammeRulesOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ProgrammeRulesViewProtocol: AnyObject {
    
    var presenter: ProgrammeRulesPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ProgrammeRulesWireframeProtocol: AnyObject {

    
}
