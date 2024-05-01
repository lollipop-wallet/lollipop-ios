
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

    var presenter: ReorderCardsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onDoneTap() {
    }
}
