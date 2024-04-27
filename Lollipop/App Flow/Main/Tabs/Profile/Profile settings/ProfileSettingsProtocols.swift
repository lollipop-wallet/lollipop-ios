//
//  ProfileSettingsProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol ProfileSettingsPresenterProtocol: UITableViewDelegate, UITableViewDataSource, ProfileSettingsCellProtocol {
    
    var interactor: ProfileSettingsInputInteractorProtocol? { get set }
    var view: ProfileSettingsViewProtocol? { get set }
    var wireframe:ProfileSettingsWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ProfileSettingsInputInteractorProtocol: AnyObject {
    
    var presenter: ProfileSettingsOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ProfileSettingsOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol ProfileSettingsViewProtocol: AnyObject {
    
    var presenter: ProfileSettingsPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol ProfileSettingsWireframeProtocol: AnyObject {
    func toPersonalData()
    func toChangePassword()
}

//MARK: ProfileSettingsCell Protocol
protocol ProfileSettingsCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
