
//
//  MyCardsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class MyCardsView: UIViewController, MyCardsViewProtocol {
    
    var tableView = UITableView()

    var presenter: MyCardsPresenterProtocol?

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
    
    //MARK: MyCardsView Protocol
    
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onEditTap() {
        presenter?.edit()
    }
    
    //MARK: Actions
    @objc func segmentAction(_ segmentedControl: UISegmentedControl) {
        presenter?.changeSegment(segment: segmentedControl.selectedSegmentIndex)
    }
}
