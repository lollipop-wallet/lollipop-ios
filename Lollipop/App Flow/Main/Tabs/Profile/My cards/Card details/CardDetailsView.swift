
//
//  CardDetailsView.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//
import UIKit

class CardDetailsView: UIViewController, CardDetailsViewProtocol {
    
    var cardImageView = UIImageView()
    var cardNameLabel = UILabel()
    var cardBarcodeLabel = UILabel()
    var cardNotesLabel = UILabel()
    var cardImageFrontSideView = UIImageView()
    var cardImageBackSideView = UIImageView()
    var nameOnTheCardLabel = UILabel()
    var cardNumberLabel = UILabel()
    
    var nameOnTheCardStack = UIStackView()
    var barCodeStack = UIStackView()
    var notesStack = UIStackView()
    var cardNumberStack = UIStackView()
    var cardNameStack = UIStackView()
    
    var presenter: CardDetailsPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: CardDetailsView Protocol
    
    func setFrontCardImageWith(image: String){
        self.cardImageFrontSideView.imageFromURL(url: image)
    }
    
    func setBackCardImageWith(image: String){
        self.cardImageBackSideView.imageFromURL(url: image)
    }
    
    func setCardNameWith(name: String){
        DispatchQueue.main.async {
            self.cardNameLabel.text = name
        }
    }
    
    func setCardNameHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.cardNameStack.isHidden = isHidden
        }
    }
    
    func setBarcodeWith(barcode: String){
        DispatchQueue.main.async {
            self.cardBarcodeLabel.text = barcode
        }
    }
    func setBarcodeHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.barCodeStack.isHidden = isHidden
        }
    }
    
    func setCardNumberWith(number: String){
        DispatchQueue.main.async {
            self.cardNumberLabel.text = number
        }
    }
    
    func setCardNumberHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.cardNumberStack.isHidden = isHidden
        }
    }
    
    func setNameOnTheCardWith(nameOnTheCard: String){
        DispatchQueue.main.async {
            self.nameOnTheCardLabel.text = nameOnTheCard
        }
    }
    
    func setNameOnTheCardHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.nameOnTheCardStack.isHidden = isHidden
        }
    }
    
    func setNotesWith(notes: String){
        DispatchQueue.main.async {
            self.cardNotesLabel.text = notes
        }
    }
    
    func setNotesHidden(isHidden: Bool){
        DispatchQueue.main.async {
            self.notesStack.isHidden = isHidden
        }
    }
    
    //MARK: Actions
    @objc func onBackTap() {
        popBack(2)
    }
    
    @objc func onEditTap() {
        presenter?.edit()
    }
}
