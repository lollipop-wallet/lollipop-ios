//
//  ProfilePresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ProfilePresenter: ProfilePresenterProtocol  {
    
    var interactor : ProfileInputInteractorProtocol?
    weak var view: ProfileViewProtocol?
    var wireframe: ProfileWireframeProtocol?
    
}

extension ProfilePresenter: ProfileOutputInteractorProtocol {
    
}
