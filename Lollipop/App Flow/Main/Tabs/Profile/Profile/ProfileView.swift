
//
//  ProfileView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ProfileView: UIViewController, ProfileViewProtocol {
    
    var avatarImageView = UIImageView()
    var nameLabel = UILabel()
    var phoneLabel = UILabel()
    var tableView = AutomaticHeightTableView(frame: .zero, style: .insetGrouped)

    var presenter: ProfilePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: ProfileView Protocol
    func setUserNameWith(name: String){
        DispatchQueue.main.async {
            self.nameLabel.text = name
        }
    }
    func setUserPhoneWith(phone: String){
        DispatchQueue.main.async {
            self.phoneLabel.text = phone
        }
    }
    func setPhoneHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.phoneLabel.isHidden = isHidden
        }
    }
    func setUserAvatarWith(avatar: String){
        DispatchQueue.main.async {
            self.avatarImageView.imageFromURL(url: avatar)
        }
    }
    
    //MARK: Actions
    @objc func onEditAvatarTap() {
        
    }
    
    @objc func onFavoriteShopsTap() {
        presenter?.myShops()
    }
    
    @objc func onLogoutTap() {
        
    }
}
