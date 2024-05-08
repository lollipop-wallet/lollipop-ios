//
//  WalletCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol WalletCardPresenterProtocol: UITableViewDelegate, UITableViewDataSource, WalletCardShopCellProtocol {
    
    var interactor: WalletCardInputInteractorProtocol? { get set }
    var view: WalletCardViewProtocol? { get set }
    var wireframe:WalletCardWireframeProtocol? { get set }
    
    func locations()
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
    func toLocations()
}

//MARK: WalletCardShopCell Protocol
protocol WalletCardShopCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
