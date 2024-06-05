
//
//  PartnerDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PartnerDetailsView: UIViewController, PartnerDetailsViewProtocol {
    
    var tableView = UITableView()
    var favoriteButton = UIButton()

    var presenter: PartnerDetailsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: PartnerDetailsView protocol
    
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setFavoriteIconWith(icon: String){
        DispatchQueue.main.async {
            self.favoriteButton.setImage(UIImage(named: icon), for: .normal)
        }
    }
    
    //MARK: Actions
    
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onFavoriteTap() {
    }

}
