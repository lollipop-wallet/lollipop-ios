
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
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: DialogueView Protocol
    
    func setIconWith(icon: String){
        DispatchQueue.main.async {
            self.iconView.image = UIImage(named: icon)
        }
    }
    
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.titleLabel.text = title
        }
    }
    
    func setSubtitleWith(subtitle: String){
        DispatchQueue.main.async {
            self.subtitleLabel.text = subtitle
        }
    }
    
    func setButtonTitleWith(buttonTitle: String){
        DispatchQueue.main.async {
            self.actionButton.setTitle(buttonTitle, for: .normal)
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onActionTap() {
        presenter?.action()
    }
}
