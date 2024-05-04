
//
//  PromotionDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PromotionDetailsView: UIViewController, PromotionDetailsViewProtocol {

    var presenter: PromotionDetailsPresenterProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }

}
