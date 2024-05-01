//
//  DeleteCardPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 1.5.24..
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class DeleteCardPresenter: DeleteCardPresenterProtocol  {
    
    var interactor : DeleteCardInputInteractorProtocol?
    weak var view: DeleteCardViewProtocol?
    var wireframe: DeleteCardWireframeProtocol?
    
}

extension DeleteCardPresenter: DeleteCardOutputInteractorProtocol {
    
}
