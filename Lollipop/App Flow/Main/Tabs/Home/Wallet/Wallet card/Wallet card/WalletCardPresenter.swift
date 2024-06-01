//
//  WalletCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class WalletCardPresenter: NSObject, WalletCardPresenterProtocol  {
    
    var interactor : WalletCardInputInteractorProtocol?
    weak var view: WalletCardViewProtocol?
    var wireframe: WalletCardWireframeProtocol?
    
    var card: Card?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func locations() {
        wireframe?.toLocations()
    }
}

extension WalletCardPresenter: WalletCardOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.card_template?.name ?? "")
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
    }
}

//MARK: UITableViewDelegate&Datasource
extension WalletCardPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.walletCardShopCell.rawValue, for: indexPath) as! WalletCardShopTableViewCell
        cell.configureWith(index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        
    }
}
