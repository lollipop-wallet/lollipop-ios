
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
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: FavoriteCardsView Protocol
    
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
}
