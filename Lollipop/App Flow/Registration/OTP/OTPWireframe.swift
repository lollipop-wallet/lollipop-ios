//
//  OTPWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OTPWireframe: OTPWireframeProtocol {
    
    
    static func createModule(OTPRef: OTPView) {
        let presenter: OTPPresenterProtocol & OTPOutputInteractorProtocol = OTPPresenter()
        OTPRef.presenter = presenter
        OTPRef.presenter?.wireframe = OTPWireframe()
        OTPRef.presenter?.view = OTPRef
        OTPRef.presenter?.interactor = OTPInteractor()
        OTPRef.presenter?.interactor?.presenter = presenter
        
    }
}
