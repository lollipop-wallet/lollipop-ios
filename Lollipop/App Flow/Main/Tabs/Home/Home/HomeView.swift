
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
    var tableView = UITableView()

    var presenter: HomePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    //MARK: HomeView Protocol
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setUserNameWith(name: String){
        DispatchQueue.main.async {
            self.avatarLabel.text = name
        }
    }
    
    func setUserAvatarWith(avatar: String){
        self.avatarImageView.imageFromURL(url: avatar)
    }
    
    //MARK: Actions
    @objc func onAvatarTap() {
        print("dwadwa")
    }
    
    @objc func onPlusTap() {
        print("dwadwa")
    }
}

