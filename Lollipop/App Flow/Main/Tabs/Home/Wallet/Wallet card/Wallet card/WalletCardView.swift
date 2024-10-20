
//
//  WalletCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class WalletCardView: UIViewController, WalletCardViewProtocol {
    
    var barcodeImageView = UIImageView()
    var barcodeNumberLabel = UILabel()
    var qrCodeImageView = UIImageView()
    var barcodeStackView = UIStackView()
    var plainNumberLabel = UILabel()
    var loyaltyCard = LoyaltyCard()
    var tableView = AutomaticHeightTableView()
    var rulesTitleLabel = UILabel()
    var aboutTitleLabel = UILabel()

    var presenter: WalletCardPresenterProtocol?

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
    
    //MARK: WalletCardView protocol
    
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
    
    func setCardImageWith(image: String) {
        DispatchQueue.main.async {
            self.loyaltyCard.imageUrl = image
        }
    }
    
    func setBarcodeNumberWith(barcode: String){
        DispatchQueue.main.async {
            self.barcodeNumberLabel.text = barcode
        }
    }
    
    func setBarcodeImageWith(image: UIImage){
        DispatchQueue.main.async {
            self.barcodeImageView.image = image
        }
    }
    
    func reload(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setQRCodeWith(image: UIImage){
        DispatchQueue.main.async {
            self.qrCodeImageView.image = image
        }
    }
    
    func setQRCodeHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.qrCodeImageView.isHidden = isHidden
        }
    }
    
    func setBarcodeHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.barcodeImageView.isHidden = isHidden
            self.barcodeNumberLabel.isHidden = isHidden
        }
    }
    
    func setPlainNumberWith(plainNumber: String){
        DispatchQueue.main.async {
            self.plainNumberLabel.text = plainNumber
        }
    }
    
    func setPlainNumberHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.plainNumberLabel.isHidden = isHidden
        }
    }
    
    func setRulesTitleWith(rulesTitle: String){
        DispatchQueue.main.async {
            self.rulesTitleLabel.text = rulesTitle
        }
    }
    
    func setAboutTitleWith(aboutTitle: String){
        DispatchQueue.main.async {
            self.aboutTitleLabel.text = aboutTitle
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onDetailsTap() {
        presenter?.details()
    }
    
    @objc func onLocationsTap() {
        presenter?.locations()
    }
    
    @objc func onAboutProgrammeTap() {
        presenter?.programme()
    }
    
    @objc func onRulesTap() {
        presenter?.rules()
    }
}
