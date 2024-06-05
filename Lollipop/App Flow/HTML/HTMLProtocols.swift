//
//  HTMLProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 5.6.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import WebKit
import SafariServices

//MARK: Presenter
// VIEW TO PRESENTER
protocol HTMLPresenterProtocol: WKNavigationDelegate, SFSafariViewControllerDelegate {
    
    var interactor: HTMLInputInteractorProtocol? { get set }
    var view: HTMLViewProtocol? { get set }
    var wireframe:HTMLWireframeProtocol? { get set }
    
    func viewDidLoad()
    func seeMore()

}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol HTMLInputInteractorProtocol: AnyObject {
    
    var presenter: HTMLOutputInteractorProtocol?  { get set }
    func viewDidLoad()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol HTMLOutputInteractorProtocol: AnyObject {
    func takeData(title: String, description: String, buttonTitle: String, externalLink: String)
}
//MARK: View
protocol HTMLViewProtocol: AnyObject {
    
    var presenter: HTMLPresenterProtocol?  { get set }
    func setTitleWith(title: String)
    func setContentWith(content: String)
    func setSeeMoreHidden(isHidden: Bool)
    func setSeeMoreTitle(buttonTitle: String)
}
//MARK: Wireframe
protocol HTMLWireframeProtocol: AnyObject {
    static var title: String? { get set }
    static var description: String? { get set }
    static var buttonTitle: String? { get set }
    static var externalLink: String? { get set }
    func openExternalLinkWith(link: String, delegate: SFSafariViewControllerDelegate)
}
