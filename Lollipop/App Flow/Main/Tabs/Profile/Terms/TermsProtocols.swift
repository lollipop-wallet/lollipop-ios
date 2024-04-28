//
//  TermsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol TermsPresenterProtocol: AnyObject {
    
    var interactor: TermsInputInteractorProtocol? { get set }
    var view: TermsViewProtocol? { get set }
    var wireframe:TermsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol TermsInputInteractorProtocol: AnyObject {
    
    var presenter: TermsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol TermsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol TermsViewProtocol: AnyObject {
    
    var presenter: TermsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol TermsWireframeProtocol: AnyObject {

    
}
