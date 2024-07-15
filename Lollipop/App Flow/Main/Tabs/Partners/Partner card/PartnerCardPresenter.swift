//
//  PartnerCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class PartnerCardPresenter: NSObject, PartnerCardPresenterProtocol  {
    
    var interactor : PartnerCardInputInteractorProtocol?
    weak var view: PartnerCardViewProtocol?
    var wireframe: PartnerCardWireframeProtocol?
    
    var datasource = DefaultModels().partnerCardOptionsDatasource
    var cardTemplate: CardTemplate?
    var partner: Partner?
    var delegate: PartnersCardControllerProtocol?
    
    func viewDidLoad() {
        interactor?.viewDidLoad()
    }
}

extension PartnerCardPresenter: PartnerCardOutputInteractorProtocol {
    func takeData(cardTemplate: CardTemplate?, partner: Partner?, delegate: PartnersCardControllerProtocol?) {
        self.cardTemplate = cardTemplate
        self.partner = partner
        self.delegate = delegate
        self.view?.setCardImageWith(imageLink: cardTemplate?.image_front ?? "")
    }
}

extension PartnerCardPresenter {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId.partnerCardCell.rawValue, for: indexPath) as! PartnerCardTableViewCell
        cell.configureWith(model: self.datasource[indexPath.row], index: indexPath, delegate: self)
        return cell
    }
    
    func didSelectItemAt(index: IndexPath) {
        let item = self.datasource[index.row]
        let card = Card(id: self.cardTemplate?.id ?? 0, name: self.cardTemplate?.name ?? "", alias: "", name_on_card: "", image_front: self.cardTemplate?.image_front ?? "", image_back: self.cardTemplate?.image_back ?? "", code: "", cardNumber: "", note: "", type: "loyalty", card_template: self.cardTemplate, partner: self.partner, position: 0, code_type: self.cardTemplate?.code_type ?? "", customer_code: "")
        
        if Manager.isRegistered {
            if item.option == .wantsCard {
                wireframe?.toPartnerNewCard(card: card)
            }else{
                wireframe?.toScannerWith(card: card)
            }
        }else{
            delegate?.toProfileTabFromPartnersCard()
            UIApplication.topViewController()?.popBackSpecific(toControllerType: MainView.self)
        }
    }
}
