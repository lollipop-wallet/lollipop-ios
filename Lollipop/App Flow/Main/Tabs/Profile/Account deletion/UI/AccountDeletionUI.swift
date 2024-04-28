//
//  AccountDeletionUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 28/04/2024.
//

import UIKit

extension AccountDeletionView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        AccountDeletionWireframe.createModule(AccountDeletionRef: self)
    }
}
