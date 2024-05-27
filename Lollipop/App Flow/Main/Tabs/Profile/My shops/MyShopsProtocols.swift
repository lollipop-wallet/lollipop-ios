//
//  MyShopsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol MyShopsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, MyShopsCellProtocol{
    
    var interactor: MyShopsInputInteractorProtocol? { get set }
    var view: MyShopsViewProtocol? { get set }
    var wireframe:MyShopsWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol MyShopsInputInteractorProtocol: AnyObject {
    
    var presenter: MyShopsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol MyShopsOutputInteractorProtocol: AnyObject {
    func parseShopsData(result: Result<MyShopsModel, AFError>)
}
//MARK: View
protocol MyShopsViewProtocol: AnyObject {
    
    var presenter: MyShopsPresenterProtocol?  { get set }
    func reload()
}
//MARK: Wireframe
protocol MyShopsWireframeProtocol: AnyObject {
    static var delegate: MyShopsControllerProtocol? { get set }
}


//MARK: MyShopsCell protocol
protocol MyShopsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: MyShopsController protocol
protocol MyShopsControllerProtocol: AnyObject {
    func favoriteShopsUpdated()
}
