//
//  MainUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension MainView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        MainWireframe.createModule(MainRef: self)
    }
}
