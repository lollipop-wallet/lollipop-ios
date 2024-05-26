
//
//  PromotionsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 3.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class PromotionsView: UIViewController, PromotionsViewProtocol {
    
    var collectionView: UICollectionView?
    var backButton = UIBarButtonItem()

    var presenter: PromotionsPresenterProtocol?

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
    
    //MARK: PromotionsView protocol
    func setNavBarColor(shouldChange: Bool){
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.titleTextAttributes = [.foregroundColor: shouldChange ? AppColors.white : AppColors.black, .font : UIFont.inter(ofSize: 20, name: .bold)]
        standardAppearance.backgroundColor = shouldChange ? AppColors.brandPrimary : AppColors.lightGrey
        navigationItem.standardAppearance = standardAppearance
        self.backButton.tintColor = shouldChange ? AppColors.white : AppColors.black
    }
    
    func reload(){
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
}
