
//
//  DisplayCardView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 8.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class DisplayCardView: UIViewController, DisplayCardViewProtocol {
    
    var barcodeImageView = UIImageView()
    var barcodeNumberLabel = UILabel()
    var barcodeStackView = UIStackView()
    var cardSerialNumberLabel = UILabel()
    var cardFrontImageView = UIImageView()
    var cardBackImageView = UIImageView()

    var presenter: DisplayCardPresenterProtocol?

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
    
    //MARK: DisplayCardView protocol
    
    func setTitleWith(title: String){
        DispatchQueue.main.async {
            self.navigationItem.title = title
        }
    }
    func setCardFrontImageWith(image: String){
        DispatchQueue.main.async {
            self.cardFrontImageView.imageFromURL(url: image)
        }
    }
    func setCardBackImageWith(image: String){
        DispatchQueue.main.async {
            self.cardBackImageView.imageFromURL(url: image)
        }
    }
    
    func setCardSerialNumberWith(serialNumber: String){
        DispatchQueue.main.async {
            self.cardSerialNumberLabel.text = serialNumber
        }
    }
    
    func setBarcodeNumberWith(barcode: String){
        DispatchQueue.main.async {
            self.barcodeNumberLabel.text = barcode
        }
    }
    func setBarcodeImageWith(image: UIImage) {
        DispatchQueue.main.async {
            self.barcodeImageView.image = image
        }
    }
    func setBarcodeHidden(isHidden: Bool){
        print("je li hidden: ", isHidden ? "da" : "ne")
        DispatchQueue.main.async {
            self.barcodeImageView.isHidden = isHidden
            self.barcodeNumberLabel.isHidden = isHidden
        }
    }
    
    func setCardNumberHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.cardSerialNumberLabel.isHidden = isHidden
        }
    }

    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onDetailsTap() {
        
    }

}
