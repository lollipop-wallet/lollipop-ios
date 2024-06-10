//
//  ChangePasswordPresenter.swift
//  Lollipop
//
//  Created Aleksandar Draskovic on 27/04/2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import UIKit
import Alamofire

class ChangePasswordPresenter: ChangePasswordPresenterProtocol  {
    
    var interactor : ChangePasswordInputInteractorProtocol?
    weak var view: ChangePasswordViewProtocol?
    var wireframe: ChangePasswordWireframeProtocol?

    func change(currentPassword: String, newPassword: String, newPasswordConfirmation: String) {
        guard !currentPassword.isEmpty, !newPassword.isEmpty, !newPasswordConfirmation.isEmpty else {
            self.view?.validate(isCurrendPwdEmpty: currentPassword.isEmpty, isNewPwdEmpty: newPassword.isEmpty, isConfirmedPwdEmpty: newPasswordConfirmation.isEmpty)
            return
        }
        interactor?.change(currentPassword: currentPassword, newPassword: newPassword, newPasswordConfirmation: newPasswordConfirmation)
    }
}

extension ChangePasswordPresenter: ChangePasswordOutputInteractorProtocol {
    func parseChangedPasswordData(result: Result<ChangePasswordModel, AFError>) {
        switch result {
        case .success(let model):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.notice.localized, text: model.message ?? "", shouldDismiss: false)
        case .failure(let error):
            Alert().alertMessageNoNavigator(title: LocalizedTitle.warning.localized, text: error.localizedDescription, shouldDismiss: false)
        }
    }
}
