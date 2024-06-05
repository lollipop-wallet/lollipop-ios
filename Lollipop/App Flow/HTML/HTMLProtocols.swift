//
//  HTMLProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol HTMLPresenterProtocol: AnyObject {
    
    var interactor: HTMLInputInteractorProtocol? { get set }
    var view: HTMLViewProtocol? { get set }
    var wireframe:HTMLWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol HTMLInputInteractorProtocol: AnyObject {
    
    var presenter: HTMLOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol HTMLOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol HTMLViewProtocol: AnyObject {
    
    var presenter: HTMLPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol HTMLWireframeProtocol: AnyObject {

    
}
