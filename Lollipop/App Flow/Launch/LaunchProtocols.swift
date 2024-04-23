//
//  LaunchProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 21.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol LaunchPresenterProtocol: AnyObject {
    
    var interactor: LaunchInputInteractorProtocol? { get set }
    var view: LaunchViewProtocol? { get set }
    var wireframe:LaunchWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol LaunchInputInteractorProtocol: AnyObject {
    
    var presenter: LaunchOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol LaunchOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol LaunchViewProtocol: AnyObject {
    
    var presenter: LaunchPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol LaunchWireframeProtocol: AnyObject {
    func toMain()
    func toOnboarding()
}
