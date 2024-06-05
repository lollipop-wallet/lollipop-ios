//
//  PromotionDetailsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import SafariServices
import WebKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol PromotionDetailsPresenterProtocol: SFSafariViewControllerDelegate, WKNavigationDelegate{
    
    var interactor: PromotionDetailsInputInteractorProtocol? { get set }
    var view: PromotionDetailsViewProtocol? { get set }
    var wireframe:PromotionDetailsWireframeProtocol? { get set }
    
    func viewDidLoad()
    func seeMore()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PromotionDetailsInputInteractorProtocol: AnyObject {
    
    var presenter: PromotionDetailsOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PromotionDetailsOutputInteractorProtocol: AnyObject {
    func takeDataWith(banner: Banner?)
}
//MARK: View
protocol PromotionDetailsViewProtocol: AnyObject {
    
    var presenter: PromotionDetailsPresenterProtocol?  { get set }
    func setTitleWith(title: String)
    func setContentWith(content: String)
}
//MARK: Wireframe
protocol PromotionDetailsWireframeProtocol: AnyObject {
    static var banner: Banner? { get set }
    func openExternalLinkWith(link: String, delegate: SFSafariViewControllerDelegate)
}
