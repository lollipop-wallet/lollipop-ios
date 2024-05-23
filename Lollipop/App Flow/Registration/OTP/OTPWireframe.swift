//
//  OTPWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 25.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class OTPWireframe: OTPWireframeProtocol {
    
    static var id: Int?
    static var email: String?
    static var otpType: OTPType?
    static var delegate: OTPControllerProtocol?
    
    static func createModule(OTPRef: OTPView) {
        let presenter: OTPPresenterProtocol & OTPOutputInteractorProtocol = OTPPresenter()
        OTPRef.presenter = presenter
        OTPRef.presenter?.wireframe = OTPWireframe()
        OTPRef.presenter?.view = OTPRef
        OTPRef.presenter?.interactor = OTPInteractor()
        OTPRef.presenter?.interactor?.presenter = presenter
        
    }
    
    func toMain(){
        let mainVC = MainView()
        let navigationController = UINavigationController(rootViewController: mainVC)
        navigationController.isNavigationBarHidden = true
        UIApplication.shared.keyWindow?.rootViewController = navigationController
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }
}
