//
//  WalletProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol WalletPresenterProtocol: WalletStackProtocol{
    
    var interactor: WalletInputInteractorProtocol? { get set }
    var view: WalletViewProtocol? { get set }
    var wireframe:WalletWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol WalletInputInteractorProtocol: AnyObject {
    
    var presenter: WalletOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol WalletOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol WalletViewProtocol: AnyObject {
    
    var presenter: WalletPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol WalletWireframeProtocol: AnyObject {
    func toWalletCard()
}
