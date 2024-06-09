
//
//  LanguageView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 28/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class LanguageView: UIViewController, LanguageViewProtocol {
    
    var tableView = AutomaticHeightTableView()
    var subtitleLabel = UILabel()
    var saveButton = UIButton()

    var presenter: LanguagePresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: LanguageView protocol
    
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
    
    func setSubtitleWith(subtitle: String){
        DispatchQueue.main.async {
            self.subtitleLabel.text = subtitle
        }
    }
    
    func setSaveButtonTitleWith(title: String){
        DispatchQueue.main.async {
            self.saveButton.setTitle(title, for: .normal)
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onSaveTap() {
        presenter?.save()
    }

}
