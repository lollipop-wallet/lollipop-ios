//
//  OTPProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

//MARK: Presenter
// VIEW TO PRESENTER
protocol OTPPresenterProtocol: AnyObject {
    
    var interactor: OTPInputInteractorProtocol? { get set }
    var view: OTPViewProtocol? { get set }
    var wireframe:OTPWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol OTPInputInteractorProtocol: AnyObject {
    
    var presenter: OTPOutputInteractorProtocol?  { get set }
    
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol OTPOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol OTPViewProtocol: AnyObject {
    
    var presenter: OTPPresenterProtocol?  { get set }
    func setSubtitleWith(subtitle: NSAttributedString)
}
//MARK: Wireframe
protocol OTPWireframeProtocol: AnyObject {

    
}
