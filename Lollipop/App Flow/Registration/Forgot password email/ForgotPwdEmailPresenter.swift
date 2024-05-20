//
//  ForgotPwdEmailPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 20/05/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit

class ForgotPwdEmailPresenter: ForgotPwdEmailPresenterProtocol  {
    
    var interactor : ForgotPwdEmailInputInteractorProtocol?
    weak var view: ForgotPwdEmailViewProtocol?
    var wireframe: ForgotPwdEmailWireframeProtocol?
    
}

extension ForgotPwdEmailPresenter: ForgotPwdEmailOutputInteractorProtocol {
    
}
