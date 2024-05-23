//
//  ForgotPasswordEmailUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 23.5.24..
//

import UIKit

extension ForgotPwdEmailView {
    func setup() {
        self.view.backgroundColor = AppColors.white
        ForgotPwdEmailWireframe.createModule(ForgotPwdEmailRef: self)
    }
}
