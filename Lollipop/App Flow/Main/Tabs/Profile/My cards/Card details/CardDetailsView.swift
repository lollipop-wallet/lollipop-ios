
//
//  CardDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class CardDetailsView: UIViewController, CardDetailsViewProtocol {
    
    var cardImageView = UIImageView()
    var cardNameLabel = UILabel()
    var cardBarcodeLabel = UILabel()
    var cardNotesLabel = UILabel()

    var presenter: CardDetailsPresenterProtocol?

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
}
