
//
//  DisplayCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class DisplayCardView: UIViewController, DisplayCardViewProtocol {
    
    var barcodeImageView = UIImageView()
    var barcodeNumberLabel = UILabel()
    var barcodeStackView = UIStackView()
    var cardSerialNumberLabel = UILabel()
    var cardFrontImageView = UIImageView()
    var cardBackImageView = UIImageView()

    var presenter: DisplayCardPresenterProtocol?

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
    
    @objc func onDetailsTap() {
        
    }

}
