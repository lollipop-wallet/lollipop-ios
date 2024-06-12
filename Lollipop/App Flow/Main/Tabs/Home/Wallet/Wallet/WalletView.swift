
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
    var noCardsView = UIView()
    var addCardBarButton = UIBarButtonItem()
    
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
    
    func setAllCardsButtonHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.allCardsButton.isHidden = isHidden
        }
    }
    
    func setNoCardsViewHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.noCardsView.isHidden = isHidden
        }
    }
    
    func setRightBarButtonItems(shouldSetAddButton: Bool){
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItems = shouldSetAddButton ? [self.addCardBarButton] : []
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onAddCardTap() {
        presenter?.addCard()
    }
    
    @objc func onSeeAllCardsTap() {
        presenter?.allCards()
    }
}
