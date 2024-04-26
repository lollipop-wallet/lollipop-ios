//
//  LollipopProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol LollipopPresenterProtocol: AnyObject {
    
    var interactor: LollipopInputInteractorProtocol? { get set }
    var view: LollipopViewProtocol? { get set }
    var wireframe:LollipopWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LollipopInputInteractorProtocol: AnyObject {
    
    var presenter: LollipopOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LollipopOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol LollipopViewProtocol: AnyObject {
    
    var presenter: LollipopPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol LollipopWireframeProtocol: AnyObject {

    
}
