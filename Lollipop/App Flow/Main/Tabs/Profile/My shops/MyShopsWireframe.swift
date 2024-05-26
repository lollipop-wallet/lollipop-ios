//
//  MyShopsWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 30/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class MyShopsWireframe: MyShopsWireframeProtocol {
    
    static var delegate: MyShopsControllerProtocol?
    
    static func createModule(MyShopsRef: MyShopsView) {
        let presenter: MyShopsPresenterProtocol & MyShopsOutputInteractorProtocol = MyShopsPresenter()
        MyShopsRef.presenter = presenter
        MyShopsRef.presenter?.wireframe = MyShopsWireframe()
        MyShopsRef.presenter?.view = MyShopsRef
        MyShopsRef.presenter?.interactor = MyShopsInteractor()
        MyShopsRef.presenter?.interactor?.presenter = presenter
        
    }
}
