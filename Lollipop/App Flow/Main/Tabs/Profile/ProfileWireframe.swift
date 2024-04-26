//
//  ProfileWireframe.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfileWireframe: ProfileWireframeProtocol {
    
    
    static func createModule(ProfileRef: ProfileView) {
        let presenter: ProfilePresenterProtocol & ProfileOutputInteractorProtocol = ProfilePresenter()
        ProfileRef.presenter = presenter
        ProfileRef.presenter?.wireframe = ProfileWireframe()
        ProfileRef.presenter?.view = ProfileRef
        ProfileRef.presenter?.interactor = ProfileInteractor()
        ProfileRef.presenter?.interactor?.presenter = presenter
        
    }
}
