//
//  WalletCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol WalletCardPresenterProtocol: AnyObject {
    
    var interactor: WalletCardInputInteractorProtocol? { get set }
    var view: WalletCardViewProtocol? { get set }
    var wireframe:WalletCardWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol WalletCardInputInteractorProtocol: AnyObject {
    
    var presenter: WalletCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol WalletCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol WalletCardViewProtocol: AnyObject {
    
    var presenter: WalletCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol WalletCardWireframeProtocol: AnyObject {

    
}

//MARK: WalletCardShopCell Protocol
protocol WalletCardShopCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
