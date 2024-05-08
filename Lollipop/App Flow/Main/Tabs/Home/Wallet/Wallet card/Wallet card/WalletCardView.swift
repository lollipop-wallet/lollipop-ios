
//
//  WalletCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class WalletCardView: UIViewController, WalletCardViewProtocol {
    
    var barcodeImageView = UIImageView()
    var barcodeNumberLabel = UILabel()
    var loyaltyCard = LoyaltyCard()
    var tableView = AutomaticHeightTableView()

    var presenter: WalletCardPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onLocationsTap() {
        presenter?.locations()
    }
    
    @objc func onAboutProgrammeTap() {
        
    }
    
    @objc func onRulesTap() {
        
    }
}
