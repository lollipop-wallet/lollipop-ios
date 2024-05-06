//
//  PartnerCardProtocols.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 06/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: Presenter
// VIEW TO PRESENTER
protocol PartnerCardPresenterProtocol: UITableViewDelegate, UITableViewDataSource,  PartnerCardOptionCellProtocol{
    
    var interactor: PartnerCardInputInteractorProtocol? { get set }
    var view: PartnerCardViewProtocol? { get set }
    var wireframe:PartnerCardWireframeProtocol? { get set }
    
}
//MARK: Interactor
//PRESENTER TO INTERACTOR
protocol PartnerCardInputInteractorProtocol: AnyObject {
    
    var presenter: PartnerCardOutputInteractorProtocol?  { get set }
    
   
}
//MARK: Interactor
//INTERACTOR TO PRESENTER
protocol PartnerCardOutputInteractorProtocol: AnyObject {
    

}
//MARK: View
protocol PartnerCardViewProtocol: AnyObject {
    
    var presenter: PartnerCardPresenterProtocol?  { get set }
    
}
//MARK: Wireframe
protocol PartnerCardWireframeProtocol: AnyObject {

    
}

//MARK: PartnerCardOptionCellProtocol
protocol PartnerCardOptionCellProtocol: AnyObject {
    func didSelectItemAt(index: IndexPath)
}
