//
//  ScannerPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 07/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ScannerPresenter: ScannerPresenterProtocol  {
    
    var interactor : ScannerInputInteractorProtocol?
    weak var view: ScannerViewProtocol?
    var wireframe: ScannerWireframeProtocol?
    
}

extension ScannerPresenter: ScannerOutputInteractorProtocol {
    
}
