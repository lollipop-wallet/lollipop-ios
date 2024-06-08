//
//  DeleteCardInteractor.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class DeleteCardInteractor: DeleteCardInputInteractorProtocol {
    
    weak var presenter: DeleteCardOutputInteractorProtocol?
    
    func viewDidLoad() {
        let delegate = DeleteCardWireframe.delegate
        let alias = DeleteCardWireframe.alias ?? ""
        presenter?.takeData(delegate: delegate, alias: alias)
    }
    
    func delete(alias: String) {
        UIApplication.topViewController()?.view.showSpinner()
        APIClient.deletecard(alias: alias) { [weak self] result in
            UIApplication.topViewController()?.view.hideSpinner()
            guard let self = self else { return }
            self.presenter?.parseDeletedCardData(result: result)
        }
    }
}
