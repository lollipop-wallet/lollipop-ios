//
//  ProfileProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ProfilePresenterProtocol: AnyObject {
    
    var interactor: ProfileInputInteractorProtocol? { get set }
    var view: ProfileViewProtocol? { get set }
    var wireframe:ProfileWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ProfileInputInteractorProtocol: AnyObject {
    
    var presenter: ProfileOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ProfileOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ProfileViewProtocol: AnyObject {
    
    var presenter: ProfilePresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ProfileWireframeProtocol: AnyObject {

    
}
