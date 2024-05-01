//
//  MyCardsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol MyCardsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MyCardsCellProtocol {
    
    var interactor: MyCardsInputInteractorProtocol? { get set }
    var view: MyCardsViewProtocol? { get set }
    var wireframe:MyCardsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol MyCardsInputInteractorProtocol: AnyObject {
    
    var presenter: MyCardsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MyCardsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol MyCardsViewProtocol: AnyObject {
    
    var presenter: MyCardsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol MyCardsWireframeProtocol: AnyObject {

    
}

//MARK: MyCardsCell Protocol
protocol MyCardsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
