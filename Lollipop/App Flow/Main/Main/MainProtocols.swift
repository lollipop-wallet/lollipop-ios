//
//  MainProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol MainPresenterProtocol: AnyObject {
    
    var interactor: MainInputInteractorProtocol? { get set }
    var view: MainViewProtocol? { get set }
    var wireframe:MainWireframeProtocol? { get set }
 
    func viewDidLoad()
    func scan()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol MainInputInteractorProtocol: AnyObject {
    
    var presenter: MainOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MainOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol?  { get set }
    func setControllersWith(vcs: [UINavigationController])

}
//MARK: Wireframe
protocol MainWireframeProtocol: AnyObject {
    func toWallet()
}
