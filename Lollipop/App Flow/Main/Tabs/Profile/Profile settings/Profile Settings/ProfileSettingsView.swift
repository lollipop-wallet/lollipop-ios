
//
//  ProfileSettingsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class ProfileSettingsView: UIViewController, ProfileSettingsViewProtocol {

    var tableView = AutomaticHeightTableView()
    
    var presenter: ProfileSettingsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        print("Ime: ", ProfileSettingsWireframe.model?.name ?? "")
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
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onDeleteAccountTap() {
        presenter?.deleteAccount()
    }
}
