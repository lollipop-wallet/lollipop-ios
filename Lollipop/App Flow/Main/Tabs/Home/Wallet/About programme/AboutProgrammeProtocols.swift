//
//  AboutProgrammeProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol AboutProgrammePresenterProtocol: AnyObject {
    
    var interactor: AboutProgrammeInputInteractorProtocol? { get set }
    var view: AboutProgrammeViewProtocol? { get set }
    var wireframe:AboutProgrammeWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol AboutProgrammeInputInteractorProtocol: AnyObject {
    
    var presenter: AboutProgrammeOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol AboutProgrammeOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol AboutProgrammeViewProtocol: AnyObject {
    
    var presenter: AboutProgrammePresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol AboutProgrammeWireframeProtocol: AnyObject {

    
}
