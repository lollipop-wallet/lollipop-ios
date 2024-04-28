//
//  AboutProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol AboutPresenterProtocol: AnyObject {
    
    var interactor: AboutInputInteractorProtocol? { get set }
    var view: AboutViewProtocol? { get set }
    var wireframe:AboutWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol AboutInputInteractorProtocol: AnyObject {
    
    var presenter: AboutOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol AboutOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol AboutViewProtocol: AnyObject {
    
    var presenter: AboutPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol AboutWireframeProtocol: AnyObject {

    
}
