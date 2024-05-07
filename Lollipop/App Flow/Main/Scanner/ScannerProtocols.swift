//
//  ScannerProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol ScannerPresenterProtocol: AnyObject {
    
    var interactor: ScannerInputInteractorProtocol? { get set }
    var view: ScannerViewProtocol? { get set }
    var wireframe:ScannerWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ScannerInputInteractorProtocol: AnyObject {
    
    var presenter: ScannerOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ScannerOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ScannerViewProtocol: AnyObject {
    
    var presenter: ScannerPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ScannerWireframeProtocol: AnyObject {

    
}
