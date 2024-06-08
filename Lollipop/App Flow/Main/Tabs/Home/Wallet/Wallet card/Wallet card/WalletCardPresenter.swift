//
//  WalletCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 4.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import RSBarcodes_Swift
import AVFoundation

class WalletCardPresenter: NSObject, WalletCardPresenterProtocol  {
    
    var interactor : WalletCardInputInteractorProtocol?
    weak var view: WalletCardViewProtocol?
    var wireframe: WalletCardWireframeProtocol?
    
    var card: Card?
    var datasource = [Brand]()
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
    
    func locations() {
        wireframe?.toLocations(partner: self.card?.partner, brands: self.datasource)
    }
    
    func details() {
        wireframe?.toCardDetails(card: self.card, delegate: self)
    }
    
    func programme() {
        wireframe?.toHTMLWith(title: self.card?.partner?.instruction?.title ?? "", description: self.card?.partner?.instruction?.description ?? "", buttonTitle: self.card?.partner?.instruction?.label ?? "", externalLink: "")
    }
    
    func rules() {
        wireframe?.toHTMLWith(title: self.card?.partner?.rule?.title ?? "", description: self.card?.partner?.rule?.description ?? "", buttonTitle: self.card?.partner?.rule?.label ?? "", externalLink: "")
    }
}

extension WalletCardPresenter: WalletCardOutputInteractorProtocol {
    func takeData(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.card_template?.name ?? "")
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
        let barcode = RSUnifiedCodeGenerator.shared.generateCode(card?.code ?? "", machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
        let image = RSAbstractCodeGenerator.resizeImage(barcode ?? UIImage(), targetSize: CGSize(width: UIScreen.main.bounds.width - 20, height: 80), contentMode: UIView.ContentMode.center) ?? UIImage()
        self.view?.setBarcodeImageWith(image: image)
        self.datasource = card?.partner?.brands ?? []
        self.view?.reload()
    }
}

//MARK: UITableViewDelegate&Datasource
extension WalletCardPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.walletCardShopCell.rawValue, for: indexPath) as! WalletCardShopTableViewCell
        cell.configureWith(item: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        wireframe?.toBrandDetailsWith(alias: item.alias ?? "")
    }
}


//MARK: CardDetailsController delegate
extension WalletCardPresenter {
    func updateCards(){}
    
    func updateCardWith(card: Card?){
        self.card = card
        self.view?.setTitleWith(title: card?.card_template?.name ?? "")
        self.view?.setCardImageWith(image: card?.card_template?.image_front ?? "")
        self.view?.setBarcodeNumberWith(barcode: card?.code ?? "")
        let barcode = RSUnifiedCodeGenerator.shared.generateCode(card?.code ?? "", machineReadableCodeObjectType: AVMetadataObject.ObjectType.code128.rawValue)
        let image = RSAbstractCodeGenerator.resizeImage(barcode ?? UIImage(), targetSize: CGSize(width: UIScreen.main.bounds.width - 20, height: 80), contentMode: UIView.ContentMode.center) ?? UIImage()
        self.view?.setBarcodeImageWith(image: image)
        self.datasource = card?.partner?.brands ?? []
        self.view?.reload()
    }
}
