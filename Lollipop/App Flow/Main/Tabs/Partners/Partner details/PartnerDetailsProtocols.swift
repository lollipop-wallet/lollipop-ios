//
//  PartnerDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerDetailsPresenterProtocol: AnyObject {
    
    var interactor: PartnerDetailsInputInteractorProtocol? { get set }
    var view: PartnerDetailsViewProtocol? { get set }
    var wireframe:PartnerDetailsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerDetailsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerDetailsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PartnerDetailsViewProtocol: AnyObject {
    
    var presenter: PartnerDetailsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PartnerDetailsWireframeProtocol: AnyObject {

    
}