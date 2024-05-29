
//
//  WalletView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class WalletView: UIViewController, WalletViewProtocol {
    
    var cardView = WalletStack()
    var allCardsButton = UIButton()
    
    var presenter: WalletPresenterProtocol?
    

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: WalletView Protocol
    
    func setCardsWith(cards: [Card]) {
        DispatchQueue.main.async {
            self.cardView.datasource = cards
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSeeAllCardsTap() {
        
    }
}
