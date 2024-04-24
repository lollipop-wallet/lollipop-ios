//
//  RegisterUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 24.4.24..
//

import UIKit

extension RegisterView {
    func setup() {
        RegisterWireframe.createModule(RegisterRef: self)
        self.view.backgroundColor = AppColors.lightGrey
    }
}
