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
protocol ProfilePresenterProtocol: UITableViewDelegate, UITableViewDataSource, ProfileCellProtocol, PHPickerViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PersonalDataControllerProtocol, MyCardsControllerProtocol{
    
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
    func updateAvatar(avatar: Data)
    func signOut()
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol ProfileOutputInteractorProtocol: AnyObject {
    func parseUserData(result: Result<ProfileModel, AFError>, delegate: ProfileControllerProtocol?)
    func parseUpdatedAvatarData(result: Result<UpdateAvatarModel, AFError>)
    func parseSignOutData(result: Result<Empty, AFError>)
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
    static var delegate: ProfileControllerProtocol? { get set }
    
    func toMyShops()
    func toPersonalData(model: ProfileModel?)
    func toMyCards(delegage: MyCardsControllerProtocol?)
    func toAbout()
    func toTerms()
    func toMain()
}

//MARK: ProfileCell Protocol
protocol ProfileCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}

//MARK: ProfileController Protocol
protocol ProfileControllerProtocol: AnyObject {
    func updateAvatar(avatar: String)
    func updateNameWith(name: String)
    func updateCardsWith(cards: [Card])
}
