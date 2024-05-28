//
//  MainProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol MainPresenterProtocol: HomeControllerProtocol, PartnersControllerProtocol {
    
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
    func getWalletCards()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MainOutputInteractorProtocol: AnyObject {
    func parseWalletCards(result: Result<[Card], AFError>)
}
//MARK: View
protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol?  { get set }
    func setControllersWith(vcs: [UINavigationController])
    func switchTabWith(index: TabBarIndex)
}
//MARK: Wireframe
protocol MainWireframeProtocol: AnyObject {
    func toWalletWith(cards: [Card])
}
