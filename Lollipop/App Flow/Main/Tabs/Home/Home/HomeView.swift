
//
//  HomeView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 26/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class HomeView: UIViewController, HomeViewProtocol {
    
    var avatarImageView = UIImageView()
    var avatarLabel = UILabel()

    var presenter: HomePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Actions
    @objc func onAvatarTap() {
        print("dwadwa")
    }
    
    @objc func onPlusTap() {
        print("dwadwa")
    }
}
