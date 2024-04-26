//
//  PartnersProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnersPresenterProtocol: AnyObject {
    
    var interactor: PartnersInputInteractorProtocol? { get set }
    var view: PartnersViewProtocol? { get set }
    var wireframe:PartnersWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnersInputInteractorProtocol: AnyObject {
    
    var presenter: PartnersOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnersOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PartnersViewProtocol: AnyObject {
    
    var presenter: PartnersPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PartnersWireframeProtocol: AnyObject {

    
}
