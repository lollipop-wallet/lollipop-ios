//
//  LollipopUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension LollipopView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        LollipopWireframe.createModule(LollipopRef: self)
    }
}
