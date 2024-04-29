
//
//  DialogueView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 29.4.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class DialogueView: UIViewController, DialogueViewProtocol {
    
    var iconView = UIImageView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var actionButton = UIButton()

    var presenter: DialoguePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onActionTap() {
        
    }
}
