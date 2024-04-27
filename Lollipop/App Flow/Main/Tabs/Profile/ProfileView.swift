
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

    var presenter: ProfilePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Actions
    @objc func onEditAvatarTap() {
        
    }
    
    @objc func onFavoriteShopsTap() {
        
    }
}
