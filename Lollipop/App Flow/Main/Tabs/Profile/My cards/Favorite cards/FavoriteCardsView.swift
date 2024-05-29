
//
//  FavoriteCardsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class FavoriteCardsView: UIViewController, FavoriteCardsViewProtocol {
    
    var tableView = UITableView()

    var presenter: FavoriteCardsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
    }

}
