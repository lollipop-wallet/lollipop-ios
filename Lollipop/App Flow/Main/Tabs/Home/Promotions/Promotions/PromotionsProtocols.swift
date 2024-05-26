//
//  PromotionsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire

//MARK: Presenter
// VIEW TO PRESENTER
protocol PromotionsPresenterProtocol: UICollectionViewDelegate, UICollectionViewDataSource, PromotionsCellProtocol {
    
    var interactor: PromotionsInputInteractorProtocol? { get set }
    var view: PromotionsViewProtocol? { get set }
    var wireframe:PromotionsWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PromotionsInputInteractorProtocol: AnyObject {
    
    var presenter: PromotionsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PromotionsOutputInteractorProtocol: AnyObject {
    func parsePromotionsData(result: Result<[Banner], AFError>)
}
//MARK: View
protocol PromotionsViewProtocol: AnyObject {
    
    var presenter: PromotionsPresenterProtocol?  { get set }
    func setNavBarColor(shouldChange: Bool)
    func reload()
}
//MARK: Wireframe
protocol PromotionsWireframeProtocol: AnyObject {
    func toDetailsWith(banner: Banner?)
}

//MARK: PromotionsCell Protocol
protocol PromotionsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
