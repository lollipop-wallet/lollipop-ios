//
//  ScannerProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import BarcodeScanner

//MARK: Presenter
// VIEW TO PRESENTER
protocol ScannerPresenterProtocol: BarcodeScannerCodeDelegate, BarcodeScannerErrorDelegate, BarcodeScannerDismissalDelegate {
    
    var interactor: ScannerInputInteractorProtocol? { get set }
    var view: ScannerViewProtocol? { get set }
    var wireframe:ScannerWireframeProtocol? { get set }
    
    func viewDidLoad()
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ScannerInputInteractorProtocol: AnyObject {
    
    var presenter: ScannerOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ScannerOutputInteractorProtocol: AnyObject {
    func takeDataWith(card: Card?)
}
//MARK: View
protocol ScannerViewProtocol: AnyObject {
    
    var presenter: ScannerPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ScannerWireframeProtocol: AnyObject {
    static var card: Card? { get set }
    func toNewCardWith(card: Card?, barcode: String)
}
