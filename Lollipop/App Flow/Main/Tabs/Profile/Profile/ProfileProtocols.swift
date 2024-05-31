//
//  ProfileProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Alamofire
import PhotosUI

//MARK: Presenter
// VIEW TO PRESENTER
protocol ProfilePresenterProtocol: UITableViewDelegate, UITableViewDataSource, ProfileCellProtocol, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var interactor: ProfileInputInteractorProtocol? { get set }
    var view: ProfileViewProtocol? { get set }
    var wireframe:ProfileWireframeProtocol? { get set }
    
    func viewDidLoad()
    func myShops()
    func editAvatar()
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol ProfileInputInteractorProtocol: AnyObject {
    
    var presenter: ProfileOutputInteractorProtocol?  { get set }
    func viewDidLoad()
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ProfileOutputInteractorProtocol: AnyObject {
    func parseUserData(result: Result<ProfileModel, AFError>)
}
//MARK: View
protocol ProfileViewProtocol: AnyObject {
    
    var presenter: ProfilePresenterProtocol?  { get set }
    func setUserNameWith(name: String)
    func setUserPhoneWith(phone: String)
    func setPhoneHidden(isHidden: Bool)
    func setUserAvatarWith(avatar: String)
    func setUserAvatarWithImage(image: UIImage)
}
//MARK: Wireframe
protocol ProfileWireframeProtocol: AnyObject {
    func toMyShops()
    func toPersonalData()
    func toMyCards()
    func toAbout()
    func toLanguage()
    func toTerms()
}

//MARK: ProfileCell Protocol
protocol ProfileCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
