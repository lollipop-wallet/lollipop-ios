//
//  HomeUI.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 26/04/2024.
//

import UIKit

extension HomeView {
    func setup() {
        self.view.backgroundColor = AppColors.lightGrey
        HomeWireframe.createModule(HomeRef: self)
    }
}
