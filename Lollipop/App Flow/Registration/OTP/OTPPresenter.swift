//
//  OTPPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OTPPresenter: OTPPresenterProtocol  {
    
    var interactor : OTPInputInteractorProtocol?
    weak var view: OTPViewProtocol?
    var wireframe: OTPWireframeProtocol?
    
}

extension OTPPresenter: OTPOutputInteractorProtocol {
    
}
