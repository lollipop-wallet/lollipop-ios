
//
//  ReorderCardsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 01/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ReorderCardsView: UIViewController, ReorderCardsViewProtocol {
    
    var tableView = UITableView()

    var presenter: ReorderCardsPresenterProtocol?

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
    
    //MARK: ReorderCardsView Protocol
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
