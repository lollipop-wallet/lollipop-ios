
//
//  PartnerCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PartnerCardView: UIViewController, PartnerCardViewProtocol {
    
    var cardImageView = UIImageView()
    var tableView = AutomaticHeightTableView()

    var presenter: PartnerCardPresenterProtocol?

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
    
    //MARK: PartnerCardView protocol
    
    func setCardImageWith(imageLink: String){
        DispatchQueue.main.async {
            self.cardImageView.imageFromURL(url: imageLink)
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }

}
