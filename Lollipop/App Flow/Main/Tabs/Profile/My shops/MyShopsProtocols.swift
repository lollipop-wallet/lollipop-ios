//
//  MyShopsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol MyShopsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MyShopsCellProtocol{
    
    var interactor: MyShopsInputInteractorProtocol? { get set }
    var view: MyShopsViewProtocol? { get set }
    var wireframe:MyShopsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol MyShopsInputInteractorProtocol: AnyObject {
    
    var presenter: MyShopsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MyShopsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol MyShopsViewProtocol: AnyObject {
    
    var presenter: MyShopsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol MyShopsWireframeProtocol: AnyObject {

    
}


//MARK: MyShopsCell protocol
protocol MyShopsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
